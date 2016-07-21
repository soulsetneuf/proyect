require 'test_helper'

class FormCultivosControllerTest < ActionController::TestCase
  setup do
    @form_cultivo = form_cultivos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:form_cultivos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create form_cultivo" do
    assert_difference('FormCultivo.count') do
      post :create, form_cultivo: { fecha: @form_cultivo.fecha, hospital_id: @form_cultivo.hospital_id, medico: @form_cultivo.medico, observaciones: @form_cultivo.observaciones, paciente_id: @form_cultivo.paciente_id, periodo: @form_cultivo.periodo, tipo_muestra: @form_cultivo.tipo_muestra }
    end

    assert_redirected_to form_cultivo_path(assigns(:form_cultivo))
  end

  test "should show form_cultivo" do
    get :show, id: @form_cultivo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @form_cultivo
    assert_response :success
  end

  test "should update form_cultivo" do
    patch :update, id: @form_cultivo, form_cultivo: { fecha: @form_cultivo.fecha, hospital_id: @form_cultivo.hospital_id, medico: @form_cultivo.medico, observaciones: @form_cultivo.observaciones, paciente_id: @form_cultivo.paciente_id, periodo: @form_cultivo.periodo, tipo_muestra: @form_cultivo.tipo_muestra }
    assert_redirected_to form_cultivo_path(assigns(:form_cultivo))
  end

  test "should destroy form_cultivo" do
    assert_difference('FormCultivo.count', -1) do
      delete :destroy, id: @form_cultivo
    end

    assert_redirected_to form_cultivos_path
  end
end
