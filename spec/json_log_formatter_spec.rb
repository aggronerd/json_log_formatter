require 'spec_helper'
require 'json_log_formatter'

RSpec.describe JsonLogFormatter do
  subject { described_class.new }
  
  let(:severity) { 'severity' }
  let(:time) { Time.now }
  let(:progname) { 'progname' }
  let(:msg) { 'msg' }
  
  it 'produces expected nice json' do
    expect(subject.call(severity, time, progname, msg)).to eq('{
  "type": "severity",
  "time": "' + time.to_s + '",
  "message": "msg",
  "progname": "progname"
}
')
  end
end