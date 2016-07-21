require 'test_helper'

class FormLaboratoriosControllerTest < ActionController::TestCase
  setup do
    @form_laboratorio = form_laboratorios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:form_laboratorios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create form_laboratorio" do
    assert_difference('FormLaboratorio.count') do
      post :create, form_laboratorio: { fecha_entrega: @form_laboratorio.fecha_entrega, fecha_toma_muestra: @form_laboratorio.fecha_toma_muestra, hospital_id: @form_laboratorio.hospital_id, paciente_id: @form_laboratorio.paciente_id, usuario_id: @form_laboratorio.usuario_id }
    end

    assert_redirected_to form_laboratorio_path(assigns(:form_laboratorio))
  end

  test "should show form_laboratorio" do
    get :show, id: @form_laboratorio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @form_laboratorio
    assert_response :success
  end

  test "should update form_laboratorio" do
    patch :update, id: @form_laboratorio, form_laboratorio: { fecha_entrega: @form_laboratorio.fecha_entrega, fecha_toma_muestra: @form_laboratorio.fecha_toma_muestra, hospital_id: @form_laboratorio.hospital_id, paciente_id: @form_laboratorio.paciente_id, usuario_id: @form_laboratorio.usuario_id }
    assert_redirected_to form_laboratorio_path(assigns(:form_laboratorio))
  end

  test "should destroy form_laboratorio" do
    assert_difference('FormLaboratorio.count', -1) do
      delete :destroy, id: @form_laboratorio
    end

    assert_redirected_to form_laboratorios_path
  end
end
