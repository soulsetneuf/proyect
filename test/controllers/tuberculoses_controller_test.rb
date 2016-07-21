require 'test_helper'

class TuberculosesControllerTest < ActionController::TestCase
  setup do
    @tuberculose = tuberculoses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tuberculoses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tuberculose" do
    assert_difference('Tuberculose.count') do
      post :create, tuberculose: { centro_de_salud: @tuberculose.centro_de_salud, form_laboratorio_id: @tuberculose.form_laboratorio_id, mendico: @tuberculose.mendico, observaciones: @tuberculose.observaciones, paciente_id: @tuberculose.paciente_id, razon: @tuberculose.razon, string: @tuberculose.string, tipo_de_muestra: @tuberculose.tipo_de_muestra }
    end

    assert_redirected_to tuberculose_path(assigns(:tuberculose))
  end

  test "should show tuberculose" do
    get :show, id: @tuberculose
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tuberculose
    assert_response :success
  end

  test "should update tuberculose" do
    patch :update, id: @tuberculose, tuberculose: { centro_de_salud: @tuberculose.centro_de_salud, form_laboratorio_id: @tuberculose.form_laboratorio_id, mendico: @tuberculose.mendico, observaciones: @tuberculose.observaciones, paciente_id: @tuberculose.paciente_id, razon: @tuberculose.razon, string: @tuberculose.string, tipo_de_muestra: @tuberculose.tipo_de_muestra }
    assert_redirected_to tuberculose_path(assigns(:tuberculose))
  end

  test "should destroy tuberculose" do
    assert_difference('Tuberculose.count', -1) do
      delete :destroy, id: @tuberculose
    end

    assert_redirected_to tuberculoses_path
  end
end
