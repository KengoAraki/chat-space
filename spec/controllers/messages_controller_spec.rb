require 'rails_helper'

describe MessagesController do

  let(:user){ create(:user) }
  let(:group){ create(:group) }
  let(:message){ create(:message) }

  before do
    sign_in user
  end

  describe 'GET #index' do

    before do
      get :index, group_id: group.id
    end

    it "renders the :index template" do
      expect(response).to render_template :index
    end
  end


  describe 'POST #create' do
    context "message is saved" do
      it "saves the new message in the database" do
        expect{
          post :create, group_id: group.id, message: attributes_for(:message)
        }.to change(Message, :count).by(1)
      end

      it "redirects to messages#index" do
        get :index, group_id: group.id
        expect(response).to render_template :index
      end
    end

    context "failed to save message" do
      it "cannnot save the new message in the database" do
        expect{
          post :create, group_id: group.id, message: attributes_for(:message, body: nil)
        }.not_to change(Message, :count)
      end

      it "redirects to messages#index" do
        get :index, group_id: group.id
        expect(response).to render_template :index
      end
    end
  end
end