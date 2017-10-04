configure_redis = lambda do |config|
  config.redis = { 
    url: JSON.parse(ENV["VCAP_SERVICES"] || "{}")
            &.fetch("compose-for-redis", nil)
            &.first
            &.dig("credentials", "uri")
  }
end

Sidekiq.configure_server(&configure_redis)
Sidekiq.configure_client(&configure_redis)
