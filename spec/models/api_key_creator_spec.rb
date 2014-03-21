require 'spec_helper'

describe ApiKeyCreator do
  let(:user) { create(:user) }

  describe "#save" do

    it "creates the api key for the user" do
      api_key_creator = ApiKeyCreator.new(user)

      expect{api_key_creator.save}.to change{ApiKey.count}.by(1)
    end
    
  end
end