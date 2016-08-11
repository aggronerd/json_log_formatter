require 'json'
require 'active_support/logger'

class JsonLogFormatter < ActiveSupport::Logger::SimpleFormatter
  attr_reader :pretty
  
  def initialize(pretty: false)
    super()
    @pretty = pretty
  end
  
  def call(severity, timestamp, progname, message)
    generate_method = pretty ? :pretty_generate : :generate  
    JSON.send(generate_method, {
      type: severity,
      time: timestamp,
      message: message,
      pid: Process.pid,
      process: $0
    }) + "\n"
  end
end