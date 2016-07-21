require 'test_helper'

class BaciloscopiaFormsControllerTest < ActionController::TestCase
  setup do
    @baciloscopia_form = baciloscopia_forms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:baciloscopia_forms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create baciloscopia_form" do
    assert_difference('BaciloscopiaForm.count') do
      post :create, baciloscopia_form: { fecha: @baciloscopia_form.fecha, hospital_id: @baciloscopia_form.hospital_id, l_j: @baciloscopia_form.l_j, paciente_id: @baciloscopia_form.paciente_id, periodo: @baciloscopia_form.periodo, razon_solicitud: @baciloscopia_form.razon_solicitud, s_t: @baciloscopia_form.s_t, tipo_muestra: @baciloscopia_form.tipo_muestra }
    end

    assert_redirected_to baciloscopia_form_path(assigns(:baciloscopia_form))
  end

  test "should show baciloscopia_form" do
    get :show, id: @baciloscopia_form
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @baciloscopia_form
    assert_response :success
  end

  test "should update baciloscopia_form" do
    patch :update, id: @baciloscopia_form, baciloscopia_form: { fecha: @baciloscopia_form.fecha, hospital_id: @baciloscopia_form.hospital_id, l_j: @baciloscopia_form.l_j, paciente_id: @baciloscopia_form.paciente_id, periodo: @baciloscopia_form.periodo, razon_solicitud: @baciloscopia_form.razon_solicitud, s_t: @baciloscopia_form.s_t, tipo_muestra: @baciloscopia_form.tipo_muestra }
    assert_redirected_to baciloscopia_form_path(assigns(:baciloscopia_form))
  end

  test "should destroy baciloscopia_form" do
    assert_difference('BaciloscopiaForm.count', -1) do
      delete :destroy, id: @baciloscopia_form
    end

    assert_redirected_to baciloscopia_forms_path
  end
end
