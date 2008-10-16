class Test::Unit::TestCase
  class << self
    def should_generate_model(model)
      should "generate #{model} model" do
        assert_generated_model_for(model) do |body|
          yield body if block_given?
        end
      end
    end

    def should_generate_factory(model)
      should "generate #{model} factory" do
        assert_generated_factory_for(model)
      end
    end
  
    def should_generate_unit_test(model)
      should "generate #{model} unit test" do
        assert_generated_unit_test_for(model)
      end
    end
  
    def should_generate_migration(migration)
      should "generate a #{migration} migration" do
        assert_generated_migration migration
      end
    end
    
    def should_not_generate_factory(model)
      should "not generate #{model} factory" do
        deny_generated_factory_for(:product)
      end
    end

  end
end