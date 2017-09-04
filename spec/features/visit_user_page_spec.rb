require 'rails_helper'

RSpec.feature "Visit user page" do
  before do
    user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
  end
  scenario "A user visit his user page" do
    visit "/"
    click_link "#{user.full_name}"
    expect(page.current_path).to eq(user_path)
  end
end