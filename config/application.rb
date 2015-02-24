require File.expand_path('../boot', __FILE__)

require "action_controller/railtie"
require "active_model/railtie"
require "active_record/railtie"
# require "action_mailer/railtie"
# require "action_view/railtie"
# require "active_job/railtie"

Bundler.require(*Rails.groups)

module CommuteTracker
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
  end
end
