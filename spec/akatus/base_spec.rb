require "spec_helper"

describe Akatus do

  context "config" do

    it "valid configuration" do
      subject.config.should_not be_empty
    end
    it "email" do
      subject.seller_email.should == "seller@store.com"
    end
    it "api_key key" do
      subject.seller_api_key.should == "1234-000000000-987654321"
    end
    it "uri key" do
      subject.akatus_uri.should == "https://test.akatus.com"
    end
    it "akatus api key" do
      subject.akatus_api_uri.should == "https://test.akatus.com/api/v1"
    end

    it "invalid environment" do
      Akatus.env = "blah"
      expect { Akatus.config }.to raise_error(Akatus::InvalidEnvironment)
    end
    it "invalid configuration" do
      Akatus.config_file = "/tmp/a-file-that-dont-exist"
      expect { Akatus.config }.to raise_error(Akatus::MissingConfiguration)
    end
  end

end
