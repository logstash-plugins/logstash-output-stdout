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
    let(:event)      { LogStash::Event.new(properties) }

    before(:each) do
      subject.register
    end

    it "sends the generated event out" do
      expect(subject.codec).to receive(:encode).with(event)
      subject.receive(event)
    end

  end

end
