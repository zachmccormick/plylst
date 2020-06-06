# frozen_string_literal: true

Datadog.configure do |c|
  if $PROGRAM_NAME =~ /sidekiq/
    Rails.logger.info("Sidekiq Datadog Initialized")
    c.use :active_record, service_name: 'sidekiq-activerecord'
    c.use :dalli, service_name: 'sidekiq-dalli'
    c.use :sidekiq, service_name: 'sidekiq'
    c.use :http, service_name: 'sidekiq-http'
    c.use :redis, service_name: 'sidekiq-redis'
  elsif $PROGRAM_NAME =~ /puma/
    Rails.logger.info("Puma Datadog Initialized")
    c.use :rails, service_name: 'plylst'
    c.use :dalli, service_name: 'plylst-dalli'
    c.use :http, service_name: 'plylst-http'
    c.use :rack, service_name: 'plylst-rack'
    c.use :redis, service_name: 'plylst-redis'
  else
    Rails.logger.info("Failed to initialize Datadog")
  end
end
