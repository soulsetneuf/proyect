require 'test_helper'

class FormMalariaControllerTest < ActionController::TestCase
  setup do
    @form_malarium = form_malaria(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:form_malaria)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create form_malarium" do
    assert_difference('FormMalarium.count') do
      post :create, form_malarium: { compl_trat: @form_malarium.compl_trat, densidad_paras: @form_malarium.densidad_paras, diagnostico: @form_malarium.diagnostico, fecha_control: @form_malarium.fecha_control, firma: @form_malarium.firma, hospital_id: @form_malarium.hospital_id, inicio_sint: @form_malarium.inicio_sint, lug_hace_sema: @form_malarium.lug_hace_sema, lugar_tratado: @form_malarium.lugar_tratado, ocupacion: @form_malarium.ocupacion, paciente_id: @form_malarium.paciente_id, persis_sintom: @form_malarium.persis_sintom, peso: @form_malarium.peso, prueba: @form_malarium.prueba, req_trat_mal_grave: @form_malarium.req_trat_mal_grave, resultado: @form_malarium.resultado, tiene_malar_trat_antimalarico: @form_malarium.tiene_malar_trat_antimalarico, tipo: @form_malarium.tipo, tipo_caso: @form_malarium.tipo_caso, trat_superv: @form_malarium.trat_superv, tratami: @form_malarium.tratami }
    end

    assert_redirected_to form_malarium_path(assigns(:form_malarium))
  end

  test "should show form_malarium" do
    get :show, id: @form_malarium
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @form_malarium
    assert_response :success
  end

  test "should update form_malarium" do
    patch :update, id: @form_malarium, form_malarium: { compl_trat: @form_malarium.compl_trat, densidad_paras: @form_malarium.densidad_paras, diagnostico: @form_malarium.diagnostico, fecha_control: @form_malarium.fecha_control, firma: @form_malarium.firma, hospital_id: @form_malarium.hospital_id, inicio_sint: @form_malarium.inicio_sint, lug_hace_sema: @form_malarium.lug_hace_sema, lugar_tratado: @form_malarium.lugar_tratado, ocupacion: @form_malarium.ocupacion, paciente_id: @form_malarium.paciente_id, persis_sintom: @form_malarium.persis_sintom, peso: @form_malarium.peso, prueba: @form_malarium.prueba, req_trat_mal_grave: @form_malarium.req_trat_mal_grave, resultado: @form_malarium.resultado, tiene_malar_trat_antimalarico: @form_malarium.tiene_malar_trat_antimalarico, tipo: @form_malarium.tipo, tipo_caso: @form_malarium.tipo_caso, trat_superv: @form_malarium.trat_superv, tratami: @form_malarium.tratami }
    assert_redirected_to form_malarium_path(assigns(:form_malarium))
  end

  test "should destroy form_malarium" do
    assert_difference('FormMalarium.count', -1) do
      delete :destroy, id: @form_malarium
    end

    assert_redirected_to form_malaria_path
  end
end
