require 'test_helper'

class UnitsControllerTest < ActionController::TestCase
  setup do
    @unit = units(:one)
    @admin = User.create(email:"t@t.de", password: "testtest", password_confirmation: "testtest", admin: true)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:units)
  end

  test "should get new" do
    sign_in @admin
    get :new
    assert_response :success
  end

  test "should create unit" do
    sign_in @admin
    assert_difference('Unit.count') do
      post :create, unit: { name: @unit.name }
    end

    assert_redirected_to edit_unit_path(assigns(:unit))
  end

  test "should show unit" do
    get :show, id: @unit
    assert_response :success
  end

  test "should get edit" do
    sign_in @admin
    get :edit, id: @unit
    assert_response :success
  end

  test "should update unit" do
    sign_in @admin
    patch :update, id: @unit, unit: { name: @unit.name }
    assert_redirected_to unit_path(assigns(:unit))
  end

  test "should destroy unit" do
    sign_in @admin
    assert_difference('Unit.count', -1) do
      delete :destroy, id: @unit
    end

    assert_redirected_to units_path
  end
end
