require 'rails_helper'

describe User do
  describe '#create' do

    it "is valid with a name, email, password, password_confirmation" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a name" do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it "is invalid without a email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "is invalid without a password" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "is invalid without a password_confirmation" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とPasswordの入力が一致しません")
    end

    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "is valid with password that has more than 8 characters" do
      user = build(:user, password: "aaaaaaaa", password_confirmation: "aaaaaaaa")
      expect(user).to be_valid
    end

     it "is invalid with password that has less than 7 characters" do
      user = build(:user, password: "aaaaaaa", password_confirmation:"aaaaaaa")
      user.valid?
      expect(user.errors[:password][0]).to include
    end
  end
end