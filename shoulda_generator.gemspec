Gem::Specification.new do |s|
  s.name = %q{shoulda_generator}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new("= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Josh Nichols"]
  s.date = %q{2008-08-28}
  s.description = %q{Generators which create tests using shoulda}
  s.email = %q{josh@technicalpickles.com}
  s.extra_rdoc_files = ["README.markdown"]
  s.files = ["rails_generators/shoulda_model/shoulda_model_generator.rb", "rails_generators/shoulda_model/templates/factory.rb", "rails_generators/shoulda_model/templates/fixtures.yml", "rails_generators/shoulda_model/templates/migration.rb", "rails_generators/shoulda_model/templates/model.rb", "rails_generators/shoulda_model/templates/unit_test.rb", "rails_generators/shoulda_model/USAGE", "rails_generators/shoulda_scaffold/shoulda_scaffold_generator.rb", "rails_generators/shoulda_scaffold/templates/blueprint/ie.css", "rails_generators/shoulda_scaffold/templates/blueprint/print.css", "rails_generators/shoulda_scaffold/templates/blueprint/screen.css", "rails_generators/shoulda_scaffold/templates/controller.rb", "rails_generators/shoulda_scaffold/templates/erb/_form.html.erb", "rails_generators/shoulda_scaffold/templates/erb/edit.html.erb", "rails_generators/shoulda_scaffold/templates/erb/index.html.erb", "rails_generators/shoulda_scaffold/templates/erb/layout.html.erb", "rails_generators/shoulda_scaffold/templates/erb/new.html.erb", "rails_generators/shoulda_scaffold/templates/erb/show.html.erb", "rails_generators/shoulda_scaffold/templates/functional_test/basic.rb", "rails_generators/shoulda_scaffold/templates/functional_test/should_be_restful.rb", "rails_generators/shoulda_scaffold/templates/haml/_form.html.haml", "rails_generators/shoulda_scaffold/templates/haml/edit.html.haml", "rails_generators/shoulda_scaffold/templates/haml/index.html.haml", "rails_generators/shoulda_scaffold/templates/haml/layout.html.haml", "rails_generators/shoulda_scaffold/templates/haml/new.html.haml", "rails_generators/shoulda_scaffold/templates/haml/show.html.haml", "rails_generators/shoulda_scaffold/templates/helper.rb", "rails_generators/shoulda_scaffold/USAGE", "Rakefile", "README.markdown", "shoulda_generator.gemspec", "Manifest"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/technicalpickles/shoulda_generator}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Shoulda_generator", "--main", "README.markdown"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{shoulda_generator}
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{Generators which create tests using shoulda}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
      s.add_development_dependency(%q<echoe>, [">= 0"])
    else
      s.add_dependency(%q<echoe>, [">= 0"])
    end
  else
    s.add_dependency(%q<echoe>, [">= 0"])
  end
end
