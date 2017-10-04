class FakeController < ApplicationController
  def work
    cpu_ms         = (params['cpu_ms'] || 50).to_i
    iowait_ms      = (params['iowait_ms'] || 250).to_i
    response_chars = (params['response_chars'] || 20_000).to_i
    
    start = Time.now

    response = 1.upto(response_chars).collect { 'a' }.join('')

    while true do
      break if ((Time.now - start) * 1000.0) > cpu_ms
    end 

    # sleep(iowait_ms / 1000.0)
    ActiveRecord::Base.connection.execute("SELECT pg_sleep(#{iowait_ms / 1000.0})")
   
    render plain: "Mocked up response with #{cpu_ms}ms cpu, "\
                  "#{iowait_ms}ms iowait, and roughly "\
                  "#{response_chars} bytes response. \n\n#{response}\n"
  end
end
