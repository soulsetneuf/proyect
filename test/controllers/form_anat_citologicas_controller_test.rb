require 'test_helper'

class FormAnatCitologicasControllerTest < ActionController::TestCase
  setup do
    @form_anat_citologica = form_anat_citologicas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:form_anat_citologicas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create form_anat_citologica" do
    assert_difference('FormAnatCitologica.count') do
      post :create, form_anat_citologica: { biopsia: @form_anat_citologica.biopsia, cama: @form_anat_citologica.cama, conservante: @form_anat_citologica.conservante, datos_anatomicos: @form_anat_citologica.datos_anatomicos, diagnostico_clinico: @form_anat_citologica.diagnostico_clinico, diagnostico_operatorio: @form_anat_citologica.diagnostico_operatorio, fecha_entrega: @form_anat_citologica.fecha_entrega, hospital_id: @form_anat_citologica.hospital_id, hospital_id: @form_anat_citologica.hospital_id, lugar_muestra: @form_anat_citologica.lugar_muestra, otros: @form_anat_citologica.otros, paciente_id: @form_anat_citologica.paciente_id, pieza_quirurgica: @form_anat_citologica.pieza_quirurgica, servicio: @form_anat_citologica.servicio }
    end

    assert_redirected_to form_anat_citologica_path(assigns(:form_anat_citologica))
  end

  test "should show form_anat_citologica" do
    get :show, id: @form_anat_citologica
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @form_anat_citologica
    assert_response :success
  end

  test "should update form_anat_citologica" do
    patch :update, id: @form_anat_citologica, form_anat_citologica: { biopsia: @form_anat_citologica.biopsia, cama: @form_anat_citologica.cama, conservante: @form_anat_citologica.conservante, datos_anatomicos: @form_anat_citologica.datos_anatomicos, diagnostico_clinico: @form_anat_citologica.diagnostico_clinico, diagnostico_operatorio: @form_anat_citologica.diagnostico_operatorio, fecha_entrega: @form_anat_citologica.fecha_entrega, hospital_id: @form_anat_citologica.hospital_id, hospital_id: @form_anat_citologica.hospital_id, lugar_muestra: @form_anat_citologica.lugar_muestra, otros: @form_anat_citologica.otros, paciente_id: @form_anat_citologica.paciente_id, pieza_quirurgica: @form_anat_citologica.pieza_quirurgica, servicio: @form_anat_citologica.servicio }
    assert_redirected_to form_anat_citologica_path(assigns(:form_anat_citologica))
  end

  test "should destroy form_anat_citologica" do
    assert_difference('FormAnatCitologica.count', -1) do
      delete :destroy, id: @form_anat_citologica
    end

    assert_redirected_to form_anat_citologicas_path
  end
end
