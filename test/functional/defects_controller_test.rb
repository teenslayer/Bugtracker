require 'test_helper'

class DefectsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:defects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create defect" do
    assert_difference('Defect.count') do
      post :create, :defect => { }
    end

    assert_redirected_to defect_path(assigns(:defect))
  end

  test "should show defect" do
    get :show, :id => defects(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => defects(:one).to_param
    assert_response :success
  end

  test "should update defect" do
    put :update, :id => defects(:one).to_param, :defect => { }
    assert_redirected_to defect_path(assigns(:defect))
  end

  test "should destroy defect" do
    assert_difference('Defect.count', -1) do
      delete :destroy, :id => defects(:one).to_param
    end

    assert_redirected_to defects_path
  end
end
