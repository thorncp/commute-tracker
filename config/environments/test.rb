Rails.application.configure do
  config.action_controller.allow_forgery_protection = false
  config.action_controller.perform_caching = false
  config.action_dispatch.show_exceptions = false
  config.action_view.raise_on_missing_translations = true
  config.active_support.deprecation = :stderr
  config.cache_classes = true
  config.consider_all_requests_local = true
  config.eager_load = false
  config.serve_static_files = true
  config.static_cache_control = 'public, max-age=3600'
  # config.action_mailer.delivery_method = :test
end
