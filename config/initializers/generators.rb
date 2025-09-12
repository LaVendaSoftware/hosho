Rails.application.configure do
  config.generators do |generator|
    generator.test_framework :rspec
    generator.integration_tool :rspec
    generator.system_tests :rspec
    generator.routing_tests false
    generator.helper_specs false
    generator.view_specs false
    generator.test_unit false
    generator.helper false
    generator.assets false
    generator.fixture_replacement :factory_bot, dir: "spec/factories"
  end
end
