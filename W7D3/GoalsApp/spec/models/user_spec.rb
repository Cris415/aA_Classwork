require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
      it {should validate_presence_of(:username)}
      it {should validate_presence_of(:password_digest)}
      it {should validate_presence_of(:session_token)}
      it {should validate_length_of(:password).is_at_least(6)}
  end

  describe "associations" do
      it {should have_many(:goals)}
      it {should have_many(:own_comments)}
  end


  describe "::find_by_credentials" do
    # let(:user){FactoryBot.create(:user)}
    # let(:user){FactoryBot.build(:user)}
    # FactoryBot.create(:user)
    

    # let(:user) { User.new('miller', 'password') }
    # user = User.new(username:'miller', password: 'password') 
    user = User.find_by(username: 'miller')

    context "with valid credentials" do 
      it "should find the correct user, given their credentials" do
          expect(User.find_by_credentials("miller", "password")).to eq(user)
      end
    end
    context "with invalid credentials" do
      it "should return nil, given a user's incorrect credentials" do
        expect(User.find_by_credentials("miller", "passwddfd")).to eq(nil)
      end
    end
  end
end




