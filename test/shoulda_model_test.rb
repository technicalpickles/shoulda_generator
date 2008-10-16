require File.join(File.dirname(__FILE__), 'test_helper')

class ShouldaModelGeneratorTest < GeneratorTestCase
  
  context "running the generator" do
    setup do
      run_generator('model', %w(Product name:string))
    end
    
    should "generator a model" do
      assert_generated_model_for(:product)
    end
  end
  
end