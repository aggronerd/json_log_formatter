require 'spec_helper'
require 'json_log_formatter'

RSpec.describe JsonLogFormatter do
  subject { described_class.new }
  
  let(:severity) { 'severity' }
  let(:time) { Time.now }
  let(:progname) { 'progname' }
  let(:msg) { 'msg' }
  let(:pid) { 1234 }
  
  before do
    allow(Process).to receive(:pid).and_return(pid)
    $0 = 'test'
  end
  
  it 'produces expected nice json' do
    expect(subject.call(severity, time, progname, msg)).to eq('{
  "type": "severity",
  "time": "' + time.to_s + '",
  "message": "msg",
  "pid": 1234,
  "process": "test"
}
')
  end
end