require 'test_helper'

class BiopsiasFormsControllerTest < ActionController::TestCase
  setup do
    @biopsias_form = biopsias_forms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:biopsias_forms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create biopsias_form" do
    assert_difference('BiopsiasForm.count') do
      post :create, biopsias_form: { datos_anatom: @biopsias_form.datos_anatom, datos_import: @biopsias_form.datos_import, diag_clinico: @biopsias_form.diag_clinico, diagnostico: @biopsias_form.diagnostico, dr: @biopsias_form.dr, hospital_id: @biopsias_form.hospital_id, macroscopico: @biopsias_form.macroscopico, medico_solicitante: @biopsias_form.medico_solicitante, microscopico: @biopsias_form.microscopico, paciente_id: @biopsias_form.paciente_id, patologo: @biopsias_form.patologo, servicio: @biopsias_form.servicio }
    end

    assert_redirected_to biopsias_form_path(assigns(:biopsias_form))
  end

  test "should show biopsias_form" do
    get :show, id: @biopsias_form
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @biopsias_form
    assert_response :success
  end

  test "should update biopsias_form" do
    patch :update, id: @biopsias_form, biopsias_form: { datos_anatom: @biopsias_form.datos_anatom, datos_import: @biopsias_form.datos_import, diag_clinico: @biopsias_form.diag_clinico, diagnostico: @biopsias_form.diagnostico, dr: @biopsias_form.dr, hospital_id: @biopsias_form.hospital_id, macroscopico: @biopsias_form.macroscopico, medico_solicitante: @biopsias_form.medico_solicitante, microscopico: @biopsias_form.microscopico, paciente_id: @biopsias_form.paciente_id, patologo: @biopsias_form.patologo, servicio: @biopsias_form.servicio }
    assert_redirected_to biopsias_form_path(assigns(:biopsias_form))
  end

  test "should destroy biopsias_form" do
    assert_difference('BiopsiasForm.count', -1) do
      delete :destroy, id: @biopsias_form
    end

    assert_redirected_to biopsias_forms_path
  end
end
