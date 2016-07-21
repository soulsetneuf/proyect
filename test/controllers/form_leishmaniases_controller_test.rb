require 'test_helper'

class FormLeishmaniasesControllerTest < ActionController::TestCase
  setup do
    @form_leishmaniase = form_leishmaniases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:form_leishmaniases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create form_leishmaniase" do
    assert_difference('FormLeishmaniasis.count') do
      post :create, form_leishmaniase: { cultivo: @form_leishmaniase.cultivo, epd: @form_leishmaniase.epd, firma: @form_leishmaniase.firma, hospital_id: @form_leishmaniase.hospital_id, idrm: @form_leishmaniase.idrm, lug_prob_infeccion: @form_leishmaniase.lug_prob_infeccion, medico_solicitante: @form_leishmaniase.medico_solicitante, n_muestras_tom: @form_leishmaniase.n_muestras_tom, otro: @form_leishmaniase.otro, paciente_id: @form_leishmaniase.paciente_id, pcr: @form_leishmaniase.pcr, post_tratam: @form_leishmaniase.post_tratam, tiempo_evol_lesion: @form_leishmaniase.tiempo_evol_lesion, tipo_lesion: @form_leishmaniase.tipo_lesion, ubicacion_lesion: @form_leishmaniase.ubicacion_lesion }
    end

    assert_redirected_to form_leishmaniase_path(assigns(:form_leishmaniase))
  end

  test "should show form_leishmaniase" do
    get :show, id: @form_leishmaniase
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @form_leishmaniase
    assert_response :success
  end

  test "should update form_leishmaniase" do
    patch :update, id: @form_leishmaniase, form_leishmaniase: { cultivo: @form_leishmaniase.cultivo, epd: @form_leishmaniase.epd, firma: @form_leishmaniase.firma, hospital_id: @form_leishmaniase.hospital_id, idrm: @form_leishmaniase.idrm, lug_prob_infeccion: @form_leishmaniase.lug_prob_infeccion, medico_solicitante: @form_leishmaniase.medico_solicitante, n_muestras_tom: @form_leishmaniase.n_muestras_tom, otro: @form_leishmaniase.otro, paciente_id: @form_leishmaniase.paciente_id, pcr: @form_leishmaniase.pcr, post_tratam: @form_leishmaniase.post_tratam, tiempo_evol_lesion: @form_leishmaniase.tiempo_evol_lesion, tipo_lesion: @form_leishmaniase.tipo_lesion, ubicacion_lesion: @form_leishmaniase.ubicacion_lesion }
    assert_redirected_to form_leishmaniase_path(assigns(:form_leishmaniase))
  end

  test "should destroy form_leishmaniase" do
    assert_difference('FormLeishmaniasis.count', -1) do
      delete :destroy, id: @form_leishmaniase
    end

    assert_redirected_to form_leishmaniases_path
  end
end
