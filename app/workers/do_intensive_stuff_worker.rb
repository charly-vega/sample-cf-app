class DoIntensiveStuffWorker
  include Sidekiq::Worker

  def perform(options = {})
    cpu_ms         = (options['cpu_ms'] || 50).to_i
    iowait_ms      = (options['iowait_ms'] || 250).to_i
    response_chars = (options['response_chars'] || 20_000).to_i
    
    start = Time.now
    
    result = 1.upto(response_chars).collect { 'a' }.join('')
    
    while true do
      break if ((Time.now - start) * 1000.0) > cpu_ms
    end 
    
    # sleep(iowait_ms / 1000.0)
    ActiveRecord::Base.connection.execute("SELECT pg_sleep(#{iowait_ms / 1000.0})")
    
    puts "Mocked up result with #{cpu_ms}ms cpu, "\
         "#{iowait_ms}ms iowait, and roughly "\
         "#{response_chars} bytes result. \n\n#{result}\n"
  end
end
