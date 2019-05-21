require "rails_helper"

RSpec.feature "User management", type: :feature do
  scenario "Edit account" do
    user = FactoryBot.create(:user, :user)
    visit edit_user_path(user)

    fill_in "user[name]", with: "Quang Phu"
    fill_in "user[birth]", with: "23/02/1998"
    fill_in "user[address]", with: "Ha Noi"
    fill_in "user[phone]", with: "0987654"
    click_button "Update"
    expect(page).to have_content("Update profile success")
  end
end
