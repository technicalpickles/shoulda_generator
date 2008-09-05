#--
# ShouldaScaffoldGeneratorConfig based on rubygems code.
# Thank you Chad Fowler, Rich Kilmer, Jim Weirich and others.
#++
class ShouldaScaffoldGeneratorConfig
  
  DEFAULT_TEMPLATING = 'haml'
  DEFAULT_FUNCTIONAL_TEST_STYLE = 'should_be_restful'
  
  def initialize()
    @config = load_file(config_file)
    
    @templating = @config[:templating] || DEFAULT_TEMPLATING
    @functional_test_style = @config[:functional_test_style] || DEFAULT_FUNCTIONAL_TEST_STYLE
  end
  
  attr_reader :templating, :functional_test_style
   
  private
   
  def load_file(filename)
    begin
      YAML.load(File.read(filename)) if filename and File.exist?(filename)
    rescue ArgumentError
      warn "Failed to load #{config_file_name}"
    rescue Errno::EACCES
      warn "Failed to load #{config_file_name} due to permissions problem."
    end or {}
  end
  
  def config_file
     File.join(find_home, '.shoulda_generator')
  end
  
  ##
  # Finds the user's home directory.
  
  def find_home
    ['HOME', 'USERPROFILE'].each do |homekey|
      return ENV[homekey] if ENV[homekey]
    end

    if ENV['HOMEDRIVE'] && ENV['HOMEPATH'] then
      return "#{ENV['HOMEDRIVE']}:#{ENV['HOMEPATH']}"
    end

    begin
      File.expand_path("~")
    rescue
      if File::ALT_SEPARATOR then
          "C:/"
      else
          "/"
      end
    end
  end
end

class ShouldaScaffoldGenerator < Rails::Generator::NamedBase
  default_options :skip_timestamps => false, :skip_migration => false, :skip_layout => true

  attr_reader   :controller_name,
                :controller_class_path,
                :controller_file_path,
                :controller_class_nesting,
                :controller_class_nesting_depth,
                :controller_class_name,
                :controller_underscore_name,
                :controller_singular_name,
                :controller_plural_name
  alias_method  :controller_file_name,  :controller_underscore_name
  alias_method  :controller_table_name, :controller_plural_name

  def initialize(runtime_args, runtime_options = {})
    super
    
    @configuration = ShouldaScaffoldGeneratorConfig.new
    
    @controller_name = @name.pluralize

    base_name, @controller_class_path, @controller_file_path, @controller_class_nesting, @controller_class_nesting_depth = extract_modules(@controller_name)
    @controller_class_name_without_nesting, @controller_underscore_name, @controller_plural_name = inflect_names(base_name)
    @controller_singular_name=base_name.singularize
    if @controller_class_nesting.empty?
      @controller_class_name = @controller_class_name_without_nesting
    else
      @controller_class_name = "#{@controller_class_nesting}::#{@controller_class_name_without_nesting}"
    end
  end

  def manifest
    record do |m|
      # Check for class naming collisions.
      m.class_collisions(controller_class_path, "#{controller_class_name}Controller", "#{controller_class_name}Helper")
      m.class_collisions(class_path, "#{class_name}")

      # Controller, helper, views, and test directories.
      m.directory(File.join('app/models', class_path))
      m.directory(File.join('app/controllers', controller_class_path))
      m.directory(File.join('app/helpers', controller_class_path))
      m.directory(File.join('app/views', controller_class_path, controller_file_name))
      m.directory(File.join('app/views/layouts', controller_class_path))
      m.directory(File.join('test/functional', controller_class_path))
      m.directory(File.join('test/unit', class_path))

      m.directory('public/stylesheets/blueprint')

      for view in scaffold_views
        m.template(
          "#{templating}/#{view}.html.#{templating}",
          File.join('app/views', controller_class_path, controller_file_name, "#{view}.html.#{templating}")
        )
      end

      # Layout and stylesheet.
      m.template("#{templating}/layout.html.#{templating}", File.join('app/views/layouts', controller_class_path, "#{controller_file_name}.html.#{templating}"))

      %w(print screen ie).each do |stylesheet|
        m.template("blueprint/#{stylesheet}.css", "public/stylesheets/blueprint/#{stylesheet}.css")
      end

      m.template(
        'controller.rb', File.join('app/controllers', controller_class_path, "#{controller_file_name}_controller.rb")
      )

      m.template("functional_test/#{functional_test_style}.rb", File.join('test/functional', controller_class_path, "#{controller_file_name}_controller_test.rb"))
      m.template('helper.rb',          File.join('app/helpers',     controller_class_path, "#{controller_file_name}_helper.rb"))

      m.route_resources controller_file_name

      m.dependency 'shoulda_model', [name] + @args, :collision => :skip
    end
  end

  def templating
    options[:templating] || @configuration.templating
  end

  def functional_test_style
    options[:functional_test_style] || @configuration.functional_test_style
  end

  protected
    # Override with your own usage banner.
    def banner
      "Usage: #{$0} scaffold ModelName [field:type, field:type]"
    end

    def add_options!(opt)
      opt.separator ''
      opt.separator 'Options:'
      opt.on("--skip-timestamps",
             "Don't add timestamps to the migration file for this model") { |v| options[:skip_timestamps] = v }
      opt.on("--skip-migration",
             "Don't generate a migration file for this model") { |v| options[:skip_migration] = v }
      opt.on("--templating [erb|haml]", "Specify the templating to use (haml by default)") { |v| options[:templating] = v }
      opt.on("--functional-test-style [basic|should_be_restful]", "Specify the style of the functional test (should_be_restful by default)") { |v| options[:functional_test_style] = v }
      
     end

    def scaffold_views
      %w[ index show new edit _form ]
    end

    def model_name
      class_name.demodulize
    end
end
