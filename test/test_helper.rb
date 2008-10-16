require 'rubygems'
gem 'ruby-debug'
require 'ruby-debug'
gem 'activesupport'
require 'active_support'
gem 'activerecord'
require 'active_record'
gem 'actionpack'
require 'action_controller'
require 'action_view'
gem 'rails'

gem 'thoughtbot-shoulda'
require 'shoulda'

require File.join(File.dirname(__FILE__), 'shoulda_macros', 'generator_macros')

require 'active_support/core_ext/test'


require File.join(File.dirname(__FILE__), 'stolen_from_railties')
@test_log = File.join(RAILS_ROOT, 'test.log')
RAILS_DEFAULT_LOGGER = Logger.new(@test_log)

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