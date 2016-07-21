require 'test_helper'

class KardexesControllerTest < ActionController::TestCase
  setup do
    @kardex = kardexes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kardexes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kardex" do
    assert_difference('Kardex.count') do
      post :create, kardex: { fecha: @kardex.fecha, insumo_reactivo_id: @kardex.insumo_reactivo_id, observaciones: @kardex.observaciones, recibido_entregado: @kardex.recibido_entregado, reg_entrada: @kardex.reg_entrada, reg_salida: @kardex.reg_salida, saldo: @kardex.saldo }
    end

    assert_redirected_to kardex_path(assigns(:kardex))
  end

  test "should show kardex" do
    get :show, id: @kardex
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @kardex
    assert_response :success
  end

  test "should update kardex" do
    patch :update, id: @kardex, kardex: { fecha: @kardex.fecha, insumo_reactivo_id: @kardex.insumo_reactivo_id, observaciones: @kardex.observaciones, recibido_entregado: @kardex.recibido_entregado, reg_entrada: @kardex.reg_entrada, reg_salida: @kardex.reg_salida, saldo: @kardex.saldo }
    assert_redirected_to kardex_path(assigns(:kardex))
  end

  test "should destroy kardex" do
    assert_difference('Kardex.count', -1) do
      delete :destroy, id: @kardex
    end

    assert_redirected_to kardexes_path
  end
end
