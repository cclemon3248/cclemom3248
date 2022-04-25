class ApplicationController < ActionController::Base
  config.generators do |g|
    g.test_framework :rspec,
                     model_specs: true,
                     view_specs: false,
                     helper_specs: false,
                     routing_specs: false,
                     controller_specs: false,
                     request_specs: false
  end
end
