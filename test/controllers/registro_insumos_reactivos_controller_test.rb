require 'test_helper'

class RegistroInsumosReactivosControllerTest < ActionController::TestCase
  setup do
    @registro_insumos_reactivo = registro_insumos_reactivos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:registro_insumos_reactivos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create registro_insumos_reactivo" do
    assert_difference('RegistroInsumosReactivo.count') do
      post :create, registro_insumos_reactivo: { cantidad: @registro_insumos_reactivo.cantidad, estado: @registro_insumos_reactivo.estado, insumo_reactivo_id: @registro_insumos_reactivo.insumo_reactivo_id, observaciones: @registro_insumos_reactivo.observaciones, personal_entregante: @registro_insumos_reactivo.personal_entregante, pesonal_receptor: @registro_insumos_reactivo.pesonal_receptor }
    end

    assert_redirected_to registro_insumos_reactivo_path(assigns(:registro_insumos_reactivo))
  end

  test "should show registro_insumos_reactivo" do
    get :show, id: @registro_insumos_reactivo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @registro_insumos_reactivo
    assert_response :success
  end

  test "should update registro_insumos_reactivo" do
    patch :update, id: @registro_insumos_reactivo, registro_insumos_reactivo: { cantidad: @registro_insumos_reactivo.cantidad, estado: @registro_insumos_reactivo.estado, insumo_reactivo_id: @registro_insumos_reactivo.insumo_reactivo_id, observaciones: @registro_insumos_reactivo.observaciones, personal_entregante: @registro_insumos_reactivo.personal_entregante, pesonal_receptor: @registro_insumos_reactivo.pesonal_receptor }
    assert_redirected_to registro_insumos_reactivo_path(assigns(:registro_insumos_reactivo))
  end

  test "should destroy registro_insumos_reactivo" do
    assert_difference('RegistroInsumosReactivo.count', -1) do
      delete :destroy, id: @registro_insumos_reactivo
    end

    assert_redirected_to registro_insumos_reactivos_path
  end
end
