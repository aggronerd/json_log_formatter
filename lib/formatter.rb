class JsonLogFormatter < ActiveSupport::Logger::SimpleFormatter
  def call(severity, timestamp, progname, message)
    {
      type: severity,
      time: timestamp,
      message: message
    }.to_json
  end
end