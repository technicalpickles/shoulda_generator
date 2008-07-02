(in /Users/nichoj/Projects/shoulda_generator)
Gem::Specification.new do |s|
  s.name = %q{shoulda_generator}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Josh Nichols"]
  s.date = %q{2008-07-02}
  s.email = %q{josh@technicalpickles.com}
  s.has_rdoc = true
  s.homepage = %q{http://github.com/technicalpickles/shoulda_generator}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{shoulda_generator}
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{Generators which create tests using shoulda}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
      s.add_development_dependency(%q<hoe>, [">= 1.7.0"])
    else
      s.add_dependency(%q<hoe>, [">= 1.7.0"])
    end
  else
    s.add_dependency(%q<hoe>, [">= 1.7.0"])
  end
end
