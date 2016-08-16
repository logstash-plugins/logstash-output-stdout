# encoding: utf-8
require_relative "../spec_helper"

describe LogStash::Outputs::Stdout do

  it "should register without errors" do
    plugin = LogStash::Plugin.lookup("output", "stdout").new({})
    expect { plugin.register }.to_not raise_error
  end

  describe "#send" do

    subject { LogStash::Outputs::Stdout.new({}) }

    let(:properties) { { "message" => "This is a message!"} }
    let(:event) { double("event") }
    let(:encoded) { double("encoded") }

    before(:each) do
      subject.register
    end

    it "sends the generated event out" do
      expect($stdout).to receive(:write).with(encoded)
      subject.multi_receive_encoded([[event, encoded]])
    end
    
  end

end
