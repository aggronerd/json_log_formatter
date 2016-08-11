require 'spec_helper'
require 'json_log_formatter'

RSpec.describe JsonLogFormatter do
  subject { described_class.new(pretty: pretty) }
  
  let(:severity) { 'severity' }
  let(:time) { Time.now }
  let(:progname) { 'progname' }
  let(:msg) { 'msg' }
  let(:pid) { 1234 }
  
  before do
    allow(Process).to receive(:pid).and_return(pid)
    $0 = 'test'
  end
  
  context 'pretty' do
    let(:pretty) { true }
    
    it 'produces expected nice json' do
      expect(subject.call(severity, time, progname, msg)).to eq('{
  "type": "severity",
  "time": ' + time.to_json + ',
  "message": "msg",
  "pid": 1234,
  "process": "test"
}
')
    end
  end
  
  context 'standard' do
    let(:pretty) { false }
    
    it 'produces json on one line' do
      expect(subject.call(severity, time, progname, msg)).to eq('{"type":"severity","time":' + time.to_json + ',"message":"msg","pid":1234,"process":"test"}
')
    end
  end
end