require 'spec_helper'
require 'beanstalk-client'
require 'active_record'
require 'active_record/errors'

describe Ayl::Beanstalk::Engine do

  context "Standard API" do

    before(:each) do
      @engine = Ayl::Beanstalk::Engine.new
      @engine.stub_chain(:logger, :info)
      @engine.stub_chain(:logger, :error)
    end

    it "should respond true to the asynchronous? message" do
      @engine.asynchronous?.should be_true
    end

    it "should return true if it has a valid connection to beanstalk" do
      mock_pool = mock("Beanstalk::Pool")

      ::Beanstalk::Pool.should_receive(:new).with([ "localhost:11300" ]).and_return(mock_pool)

      @engine.is_connected?.should be_true
    end

    it "should return false if it does not have a valid connection to beanstalk" do
      ::Beanstalk::Pool.should_receive(:new).with([ "localhost:11300" ]).and_raise(::Beanstalk::NotConnected)

      @engine.is_connected?.should be_false
    end

    context "Message Submission" do
      
      before(:each) do
        @msg = Ayl::Message.new(23, :to_s, Ayl::MessageOptions.new, 2)
      end

      it "should submit the specified message to beanstalk" do
        mock_pool = mock("Beanstalk::Pool")
        mock_pool.should_receive(:use).with("default")
        mock_pool.should_receive(:yput).with( { :type => :ayl, :code => "23.to_s(2)" }, 512, 0, 120)

        ::Beanstalk::Pool.should_receive(:new).with([ "localhost:11300" ]).and_return(mock_pool)

        @engine.submit(@msg)
      end
    end

    context "Message Processing" do
      
      it "should wait for a message to be received from beanstalk and process it" do
        mock_job = mock("Beanstalk::Job")
        mock_job.should_receive(:delete)
        mock_job.should_receive(:body).and_return("---\n:type: :ayl\n:code: 23.to_s(2)\n")

        mock_pool = mock("Beanstalk::Pool")
        mock_pool.should_receive(:watch).with("default")
        # Returns nil on the second call.
        mock_pool.should_receive(:reserve).and_return(mock_job, nil)

        ::Beanstalk::Pool.should_receive(:new).with([ "localhost:11300" ]).and_return(mock_pool)

        @engine.process_messages
        
      end

      it "should deal with an active-record exception on receipt of message" do
        mock_job = mock("Beanstalk::Job")
        mock_job.should_receive(:delete)
        mock_job.should_receive(:body).and_return("---\n:type: :ayl\n:code: Dog\n")

        mock_pool = mock("Beanstalk::Pool")
        mock_pool.should_receive(:watch).with("default")
        mock_pool.should_receive(:reserve).and_return(mock_job, nil)

        ::Beanstalk::Pool.should_receive(:new).with([ "localhost:11300" ]).and_return(mock_pool)

        @engine.should_receive(:eval).and_raise(ActiveRecord::RecordNotFound)

        @engine.process_messages
      end
    end
  end

end
