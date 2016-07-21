require 'test_helper'

class InsumoReactivosControllerTest < ActionController::TestCase
  setup do
    @insumo_reactivo = insumo_reactivos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:insumo_reactivos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create insumo_reactivo" do
    assert_difference('InsumoReactivo.count') do
      post :create, insumo_reactivo: { cantidad: @insumo_reactivo.cantidad, costo_total: @insumo_reactivo.costo_total, costo_unitario: @insumo_reactivo.costo_unitario, descripcion: @insumo_reactivo.descripcion, form_laboratorio_id: @insumo_reactivo.form_laboratorio_id, nombre: @insumo_reactivo.nombre, partida: @insumo_reactivo.partida, tipo: @insumo_reactivo.tipo, unidad_medida: @insumo_reactivo.unidad_medida }
    end

    assert_redirected_to insumo_reactivo_path(assigns(:insumo_reactivo))
  end

  test "should show insumo_reactivo" do
    get :show, id: @insumo_reactivo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @insumo_reactivo
    assert_response :success
  end

  test "should update insumo_reactivo" do
    patch :update, id: @insumo_reactivo, insumo_reactivo: { cantidad: @insumo_reactivo.cantidad, costo_total: @insumo_reactivo.costo_total, costo_unitario: @insumo_reactivo.costo_unitario, descripcion: @insumo_reactivo.descripcion, form_laboratorio_id: @insumo_reactivo.form_laboratorio_id, nombre: @insumo_reactivo.nombre, partida: @insumo_reactivo.partida, tipo: @insumo_reactivo.tipo, unidad_medida: @insumo_reactivo.unidad_medida }
    assert_redirected_to insumo_reactivo_path(assigns(:insumo_reactivo))
  end

  test "should destroy insumo_reactivo" do
    assert_difference('InsumoReactivo.count', -1) do
      delete :destroy, id: @insumo_reactivo
    end

    assert_redirected_to insumo_reactivos_path
  end
end
