require 'test_helper'

class LaboratoriosControllerTest < ActionController::TestCase
  setup do
    @laboratorio = laboratorios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:laboratorios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create laboratorio" do
    assert_difference('Laboratorio.count') do
      post :create, laboratorio: { nombre: @laboratorio.nombre, persona_id: @laboratorio.persona_id }
    end

    assert_redirected_to laboratorio_path(assigns(:laboratorio))
  end

  test "should show laboratorio" do
    get :show, id: @laboratorio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @laboratorio
    assert_response :success
  end

  test "should update laboratorio" do
    patch :update, id: @laboratorio, laboratorio: { nombre: @laboratorio.nombre, persona_id: @laboratorio.persona_id }
    assert_redirected_to laboratorio_path(assigns(:laboratorio))
  end

  test "should destroy laboratorio" do
    assert_difference('Laboratorio.count', -1) do
      delete :destroy, id: @laboratorio
    end

    assert_redirected_to laboratorios_path
  end
end
