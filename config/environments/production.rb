require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Code is not reloaded between requests.
  config.enable_reloading = false

  # Eager load code on boot.
  config.eager_load = true

  # Full error reports are disabled.
  config.consider_all_requests_local = false

  # Turn on caching in views
  config.action_controller.perform_caching = true

  # Cache assets for far-future expiry
  config.public_file_server.headers = {
    "Cache-Control" => "public, max-age=#{1.year.to_i}"
  }

  # Use local Active Storage (or change to :amazon, :google, etc. if needed)
  config.active_storage.service = :local

  # SSL settings
  config.assume_ssl = true
  config.force_ssl = true

  # Logging
  config.log_tags = [ :request_id ]
  config.logger = ActiveSupport::TaggedLogging.new(Logger.new(STDOUT))
  config.log_level = ENV.fetch("RAILS_LOG_LEVEL", "info")
  config.silence_healthcheck_path = "/up"
  config.active_support.report_deprecations = false

  # ✅ REDIS cache store setup
  config.cache_store = :redis_cache_store, {
    url: ENV["REDIS_URL"],
    namespace: "cache"
  }

  # ✅ Active Job: SolidQueue (database-backed)
  config.active_job.queue_adapter = :solid_queue
  config.solid_queue.connects_to = {
    database: { writing: :primary }
  }

  # ActionMailer default URL (adjust host)
  config.action_mailer.default_url_options = { host: "example.com" }

  # I18n fallbacks
  config.i18n.fallbacks = true

  # Do not dump schema
  config.active_record.dump_schema_after_migration = false

  # Only show :id in logs for ActiveRecord
  config.active_record.attributes_for_inspect = [:id]

  # Uncomment and set if needed
  # config.hosts << "yourdomain.com"
end
