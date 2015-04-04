Rails.application.configure do
  config.action_controller.perform_caching = false
  config.active_support.deprecation = :log
  config.cache_classes = false
  config.consider_all_requests_local = true
  config.eager_load = false
  config.action_mailer.default_url_options = { host: 'localhost:3000' }
end
