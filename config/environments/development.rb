Yesser::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  config.action_mailer.default_url_options = {:host => "localhost:3000"}
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :domain               => 'yesser.herokuapp.com',
    :user_name            => 'yesser.be0@gmail.com',
    :password             => 'KyfGQ2sfK2iMS05GVB7_wpfjo-vVSU',
    :authentication       => 'plain',
    :enable_starttls_auto => true
  }

  config.assets.paths << Rails.root.join("app", "assets", "adminlte")
  # config.assets.precompile += %w( stylesheets/AdminLTE.css )
  # config.assets.precompile += %w( stylesheets/ionicons.css )
  # config.assets.precompile += %w( stylesheets/font-awesome.min.css )
  # config.assets.precompile += %w( javascripts/app.js )
  config.assets.precompile += %w( #{Rails.root}/vendor/assets/stylesheets/active_admin.css.scss)
  config.assets.precompile += %w( #{Rails.root}/vendor/assets/javascripts/active_admin.js.coffee)
  config.assets.precompile += %w( fonts/fontawesome-webfont.ttf fonts/glyphicons-halflings-regular.ttf fonts/fontawesome-webfont.woff fonts/glyphicons-halflings-regular.woff ) 
  config.assets.precompile += %w( fonts/*.svg fonts/*.eot fonts/*.woff fonts/*.ttf ) 

end
