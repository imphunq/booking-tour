require "rails_helper"

RSpec.describe Admin::LocationsController, type: :controller do
  let(:user) {FactoryBot.create :user, :admin}
  before { session[:user_id] = user.id }
  let(:tour) {FactoryBot.create :tour}
  let(:location) {FactoryBot.create :location, tour_id: tour.id}
  subject {location}
  let(:invalid_location) do
    {name: ""}
  end
  describe "GET #new" do
    it "assign blank location to the view" do
      get :new
      expect(assigns(:location)).to be_a_new(Location)
    end
  end

  describe "GET #index" do
    it "assign @locations" do
      get :index
      expect(assigns(:locations)).to eq([location])
    end

    it "render to index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #edit" do
    before {get :edit, params: {id: location.id}}
    it "assign @location" do
      expect(assigns(:location)).to eq(location)
    end

    it "render to edit template" do
      expect(response).to render_template :edit
    end
  end

  describe "PATCH #update" do
    it "update with name" do
      patch :update, params: {id: subject.id, location: {name: "Ho Chi Minh"}}
      expect(flash[:success]).to match(I18n.t("admin.update.edit_succ"))
      expect(response).to redirect_to(admin_locations_path)
    end

    it "update with invalid name" do
      patch :update, params: {id: subject.id, location: {name: ""}}
      expect(response).to render_template :edit
    end
  end

  describe "DELETE #destroy" do
    before {delete :destroy, params: {id: subject.id}}
    context "success" do
      it "delete success" do
        expect(flash[:success]).to match(I18n.t("admin.destroy.delete_succ"))
        expect(response).to redirect_to(admin_locations_path)
      end
    end
  end

end
