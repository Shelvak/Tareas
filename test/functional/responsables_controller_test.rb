require 'test_helper'

class ResponsablesControllerTest < ActionController::TestCase
  setup do
    @responsable = responsables(:rock_in_rio)
  end

  test "should get index" do
    ResponsableSession.create(responsables(:nenenn))
    get :index
    assert_response :success
    assert_not_nil assigns(:responsables)
  end

  test "should get new" do
    ResponsableSession.create(responsables(:nenenn))
    get :new
    assert_response :success
  end

  test "should create responsable" do
    assert_difference('Responsable.count') do
      post :create, :responsable => {
        :nombre => 'tu hermana en bola',
        :email => 'lalala@lala.com',
        :password => '12345',
        :password_confirmation => '12345',
      }
    end

    assert_redirected_to responsable_path(assigns(:responsable))
  end

  test "should show responsable" do
    ResponsableSession.create(responsables(:nenenn))
    get :show, :id => @responsable.to_param
    assert_response :success
  end

  test "should get edit" do
    ResponsableSession.create(responsables(:nenenn))
    get :edit, :id => @responsable.to_param
    assert_response :success
  end

  test "should update responsable" do
    ResponsableSession.create(responsables(:nenenn))
    put :update, :id => @responsable.to_param, :responsable => @responsable.attributes
    assert_redirected_to responsable_path(assigns(:responsable))
  end

  test "should destroy responsable" do
    ResponsableSession.create(responsables(:nenenn))
    assert_difference('Responsable.count', -1) do
      delete :destroy, :id => @responsable.to_param
    end

    assert_redirected_to responsables_path
  end
end
