require File.join(File.dirname(__FILE__), '..', 'test_helper')


class ShouldaModelGeneratorTest < GeneratorTestCase
  context "running the default generator" do
    setup do
      run_generator('shoulda_model', %w(Product name:string supplier_id:integer created_at:timestamp))
    end
    
    should_generate_model :product
    should_generate_factory :product
    should_generate_unit_test :product
    should_generate_migration :create_products
    
    should "generate migration" do
      assert_generated_migration :create_products do |t|
        assert_generated_column t, :name, :string
        assert_generated_column t, :supplier_id, :integer
        assert_generated_column t, :created_at, :timestamp
      end
    end
  end
  
  context "running the generator, when skipping factory and migration" do
    setup do
      run_generator('shoulda_model', %w(Product name:string supplier_id:integer created_at:timestamp --skip-factory))
    end
    
    should_generate_model :product
    should_not_generate_factory :product
    should_generate_unit_test :product
    should_generate_migration :create_products
    
    should "not generate migration" do
      assert_skipped_migration :create_products
    end
  end
  
end