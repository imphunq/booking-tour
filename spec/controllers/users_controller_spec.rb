require "rails_helper"

RSpec.describe UsersController, type: :controller do
  let(:user) {FactoryBot.create :user}
  subject {user}
  let(:user_invalid) do
    {name: ""}
  end

  context "before action" do
    it { expect(controller).to use_before_action(:find_user) }
  end

  describe "GET #new" do
    it "assigns a blank user to the view" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      before {post :create,
      params: {user: FactoryBot.attributes_for(:user)}}
      it "creates a new category" do
        expect(assigns(:user)).to be_a User
      end

      it "redirect after create" do
        expect(flash[:success]).to match(I18n.t("users.create.regis_success"))
        expect(response).to redirect_to(signup_path)
      end
    end

    context "invalid params" do
      before {post :create, params: {user: user_invalid}}
      it "create fail" do
        expect(response).to render_template :new
      end
    end
  end

  describe "PATCH #update" do
    context "update success" do
      it "update with name" do
        patch :update, params: {id: subject.id, user: {name: "Quang Phu"}}
        expect(flash[:success]).to match(I18n.t("controllers.users_controller.update_succ"))
        expect(response).to redirect_to(edit_user_path)
      end
    end
  end

  context "update user" do
    it "update fail" do
      patch :update, params: {id: subject.id, user: {name: ""}}
      expect(response).to render_template :edit
    end
  end
end
