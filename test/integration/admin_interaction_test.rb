require 'test_helper'

class AdminInteractionTest < ActionDispatch::IntegrationTest
  setup do
    @password = "adminadmin"
    @user = User.create!(email:"admin@test.de", password: @password, password_confirmation: @password, admin: true)
    @unit = Unit.create!(name:"test")
    @unit_subscription = UnitSubscription.create!(user: @user,unit: @unit)
  end


  test "admin can login and get redirected to Unitselection" do
    sign_in_as(@user,@password)

    #Assertions
    assert_equal "/", current_path

    within("h2") do
      assert has_content?("Welcome"), "No greeting listed"
    end
  end

  test "admin can edit a unit" do
    sign_in_as(@user,@password)
    visit "/units"
    assert has_content?("Edit")
    first("#edit_link").click_link("Edit")
    assert_match /units\/\d+\/edit/, current_path
  end

  test "admin can create a unit" do
    sign_in_as(@user,@password)
    visit "/units"
    assert has_content?("New")
    click_link("New")
    assert_match /units\/new/, current_path
  end



end
