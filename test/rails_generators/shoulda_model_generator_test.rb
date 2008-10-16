require File.join(File.dirname(__FILE__), '..', 'test_helper')

class ShouldaModelGeneratorTest < GeneratorTestCase
  
  context "running the default generator" do
    setup do
      run_generator('shoulda_model', %w(Product name:string))
    end
    
    should_generate_model :product
    should_generate_factory :product
    should_generate_unit_test :product
    should_generate_migration :create_products
  end
  
  context "running the generator, when skipping factory" do
    setup do
      run_generator('shoulda_model', %w(Product name:string --skip-factory))
    end
    
    should_generate_model :product
    should_not_generate_factory :product
    should_generate_unit_test :product
    should_generate_migration :create_products
  end
  
end