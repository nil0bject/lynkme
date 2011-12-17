require 'test_helper'

class LynksControllerTest < ActionController::TestCase
  setup do
    @lynk = lynks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lynks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lynk" do
    assert_difference('Lynk.count') do
      post :create, :lynk => @lynk.attributes
    end

    assert_redirected_to lynk_path(assigns(:lynk))
  end

  test "should show lynk" do
    get :show, :id => @lynk.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @lynk.to_param
    assert_response :success
  end

  test "should update lynk" do
    put :update, :id => @lynk.to_param, :lynk => @lynk.attributes
    assert_redirected_to lynk_path(assigns(:lynk))
  end

  test "should destroy lynk" do
    assert_difference('Lynk.count', -1) do
      delete :destroy, :id => @lynk.to_param
    end

    assert_redirected_to lynks_path
  end
end
