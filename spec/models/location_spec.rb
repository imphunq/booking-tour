require "rails_helper"

RSpec.describe Location, type: :model do
  let(:tour) {FactoryBot.create :tour}
  let(:location) {FactoryBot.create :location, tour_id: tour.id}

  context "associations" do
    it {is_expected.to belong_to(:tour)}
    it {is_expected.to have_many(:comments).dependent(:destroy)}
    it {is_expected.to have_many(:orders).dependent(:destroy)}
  end

  context "name" do
    it {is_expected.to validate_presence_of(:name)}
  end

  context "description" do
    it {is_expected.to validate_presence_of(:description)}
  end

  context "address" do
    it {is_expected.to validate_presence_of(:address)}
  end

  context "scopes" do
    let(:location_1) {FactoryBot.create :location, tour_id: tour.id, created_at: "2019-05-23", name: "Quang Phu"}
    let(:location_2) {FactoryBot.create :location, tour_id: tour.id, created_at: "2019-06-22", name: "Thu Thuy"}
    let(:location_3) {FactoryBot.create :location, tour_id: tour.id, created_at: "2019-07-12", name: "Quang Loi"}
    let(:location_4) {FactoryBot.create :location, tour_id: tour.id, created_at: "2019-08-11", name: "Thanh Tuan"}

    it {expect(Location.order_created_at_desc).to eq([location_4,location_3,location_2,location_1])}
    it {expect(Location.get_location_newest).to eq([location_4,location_3,location_2])}
    it {expect(Location.filter_by_name("Quang")).to eq([location_1,location_3])}
  end

  context "column" do
    it {is_expected.to have_db_column(:name).of_type(:string)}
    it {is_expected.to have_db_column(:address).of_type(:string)}
    it {is_expected.to have_db_column(:description).of_type(:text)}
    it {is_expected.to have_db_column(:picture).of_type(:string)}
    it {is_expected.to have_db_column(:tour_id).of_type(:integer)}
  end
end
