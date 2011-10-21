#encoding: UTF-8
require 'test_helper'

class TareasControllerTest < ActionController::TestCase
  setup do
    @tarea = tareas(:ir_al_curso)
  end

  test "should get index" do
    ResponsableSession.create(responsables(:nenenn))
    get :index
    assert_response :success
    assert_not_nil assigns(:tareas)
  end

  test "should get new" do
    ResponsableSession.create(responsables(:nenenn))
    get :new
    assert_response :success
  end

  test "should create tarea" do
    ResponsableSession.create(responsables(:nenenn))
    assert_difference('Tarea.count') do
      post :create, :tarea => @tarea.attributes
    end

    assert_redirected_to tarea_path(assigns(:tarea))
  end

  test "should show tarea" do
    ResponsableSession.create(responsables(:nenenn))
    get :show, :id => @tarea.to_param
    assert_response :success
  end

  test "should get edit" do
    ResponsableSession.create(responsables(:nenenn))
    get :edit, :id => @tarea.to_param
    assert_response :success
  end

  test "should update tarea" do
    ResponsableSession.create(responsables(:nenenn))
    put :update, :id => @tarea.to_param, :tarea => @tarea.attributes
    assert_redirected_to tarea_path(assigns(:tarea))
  end

  test "should destroy tarea" do
    ResponsableSession.create(responsables(:nenenn))
    assert_difference('Tarea.count', -1) do
      delete :destroy, :id => @tarea.to_param
    end

    assert_redirected_to tareas_path
  end
end
