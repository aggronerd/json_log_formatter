require 'json'
require 'active_support/logger'

class JsonLogFormatter < ActiveSupport::Logger::SimpleFormatter
  def call(severity, timestamp, progname, message)
    JSON.pretty_generate({
      type: severity,
      time: timestamp,
      message: message
    }) + "\n"
  end
end