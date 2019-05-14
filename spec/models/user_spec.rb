require "rails_helper"

RSpec.describe User, type: :model do
  context "valid user" do
    subject {FactoryBot.build :user}
    it {is_expected.to be_valid}
  end

  context "associations" do
    it {is_expected.to have_many(:orders).dependent(:destroy)}
    it {is_expected.to have_many(:comments).dependent(:destroy)}
  end

  context "name" do
    it {is_expected.to validate_presence_of(:name)}
    it {is_expected.to validate_length_of(:name).is_at_most Settings.maximum_name}
  end

  context "email" do
    it {is_expected.to validate_presence_of(:email)}
    it {is_expected.to validate_length_of(:email).is_at_most Settings.maximum_email}
    it {is_expected.to validate_uniqueness_of(:email).case_insensitive}
    it {is_expected.to allow_value("email@address.com").for(:email)}
  end

  context "password" do
    it {is_expected.to validate_length_of(:password).is_at_least Settings.minimum_pass}
    it {is_expected.not_to allow_value(nil).for(:password)}
  end

  context "address" do
    it {is_expected.to validate_length_of(:address).is_at_least Settings.minimum_address}
  end

  context "permission" do
    it {is_expected.to validate_inclusion_of(:permission).in_array([true,false])}
  end

  context "phone" do
    it {is_expected.to validate_length_of(:phone).is_at_least(10)}
  end

  context "gender" do
    it {is_expected.to validate_inclusion_of(:gender).in_array(["Male","Female",nil])}
  end

  context "secure" do
    it {is_expected.to have_secure_password}
  end

  context "scope" do
    let!(:user_1) {FactoryBot.create :user}
    let!(:user_2) {FactoryBot.create :user}
    context "select_column" do
      let(:users_scoped) {User.select_column}
      it {
        expect(users_scoped.first.read_attribute(:email)).not_to be(nil)
      }
      it {expect(users_scoped.first.read_attribute(:birth)).to be(nil)}
    end
  end

  context "columns" do
    it {is_expected.to have_db_column(:email).of_type(:string)}
    it {is_expected.to have_db_column(:name).of_type(:string)}
    it {is_expected.to have_db_column(:birth).of_type(:datetime)}
    it {is_expected.to have_db_column(:gender).of_type(:string)}
    it {is_expected.to have_db_column(:address).of_type(:string)}
    it {is_expected.to have_db_column(:phone).of_type(:string)}
    it {is_expected.to have_db_column(:permission).of_type(:boolean).with_options(default: false)}
  end
end
