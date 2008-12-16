require 'rubygems'
require 'ruby-debug'
require 'active_support'
require 'active_record'
require 'action_controller'
require 'action_view'

require 'shoulda'

require 'mocha'

require File.join(File.dirname(__FILE__), 'shoulda_macros', 'generator_macros')



require File.join(File.dirname(__FILE__), 'stolen_from_railties')

unless defined?(RAILS_DEFAULT_LOGGER)
  @test_log = File.join(RAILS_ROOT, 'test.log')
  RAILS_DEFAULT_LOGGER = Logger.new(@test_log)
end

Rails::Generator::Base.prepend_sources Rails::Generator::PathSource.new(:shoulda_generator, File.join(File.dirname(__FILE__), "..", "rails_generators"))

class GeneratorTestCase
  # Asserts that the given factory was created.
  def assert_generated_factory_for(name)
    assert_generated_file "test/factories/#{name.to_s.underscore}_factory.rb"
  end
  
  # Asserts that the given factory was NOT created.
  def deny_generated_factory_for(name)
    deny_file_exists "test/factories/#{name.to_s.underscore}_factory.rb"
  end
  
  # asserts that the given file DOES NOT exists
  def deny_file_exists(path)
    assert ! File.exist?("#{RAILS_ROOT}/#{path}"),
      "The file '#{RAILS_ROOT}/#{path}' should not exist"
  end
end
