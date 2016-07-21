require 'test_helper'

class TuberculosisControllerTest < ActionController::TestCase
  setup do
    @tuberculosi = tuberculosis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tuberculosis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tuberculosi" do
    assert_difference('Tuberculosi.count') do
      post :create, tuberculosi: { centro_de_salud: @tuberculosi.centro_de_salud, form_laboratorio_id: @tuberculosi.form_laboratorio_id, medico: @tuberculosi.medico, observaciones: @tuberculosi.observaciones, paciente_id: @tuberculosi.paciente_id, razon: @tuberculosi.razon, tipo_de_muestra: @tuberculosi.tipo_de_muestra }
    end

    assert_redirected_to tuberculosi_path(assigns(:tuberculosi))
  end

  test "should show tuberculosi" do
    get :show, id: @tuberculosi
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tuberculosi
    assert_response :success
  end

  test "should update tuberculosi" do
    patch :update, id: @tuberculosi, tuberculosi: { centro_de_salud: @tuberculosi.centro_de_salud, form_laboratorio_id: @tuberculosi.form_laboratorio_id, medico: @tuberculosi.medico, observaciones: @tuberculosi.observaciones, paciente_id: @tuberculosi.paciente_id, razon: @tuberculosi.razon, tipo_de_muestra: @tuberculosi.tipo_de_muestra }
    assert_redirected_to tuberculosi_path(assigns(:tuberculosi))
  end

  test "should destroy tuberculosi" do
    assert_difference('Tuberculosi.count', -1) do
      delete :destroy, id: @tuberculosi
    end

    assert_redirected_to tuberculosis_path
  end
end
