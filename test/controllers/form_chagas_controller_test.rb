require 'test_helper'

class FormChagasControllerTest < ActionController::TestCase
  setup do
    @form_chaga = form_chagas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:form_chagas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create form_chaga" do
    assert_difference('FormChaga.count') do
      post :create, form_chaga: { cod_form_chagas: @form_chaga.cod_form_chagas, conclu_pueb_confir: @form_chaga.conclu_pueb_confir, conclucion_diag: @form_chaga.conclucion_diag, diag_confir: @form_chaga.diag_confir, diag_serologico: @form_chaga.diag_serologico, firma: @form_chaga.firma, hospital_id: @form_chaga.hospital_id, muestra: @form_chaga.muestra, observaciones: @form_chaga.observaciones, paciente_id: @form_chaga.paciente_id }
    end

    assert_redirected_to form_chaga_path(assigns(:form_chaga))
  end

  test "should show form_chaga" do
    get :show, id: @form_chaga
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @form_chaga
    assert_response :success
  end

  test "should update form_chaga" do
    patch :update, id: @form_chaga, form_chaga: { cod_form_chagas: @form_chaga.cod_form_chagas, conclu_pueb_confir: @form_chaga.conclu_pueb_confir, conclucion_diag: @form_chaga.conclucion_diag, diag_confir: @form_chaga.diag_confir, diag_serologico: @form_chaga.diag_serologico, firma: @form_chaga.firma, hospital_id: @form_chaga.hospital_id, muestra: @form_chaga.muestra, observaciones: @form_chaga.observaciones, paciente_id: @form_chaga.paciente_id }
    assert_redirected_to form_chaga_path(assigns(:form_chaga))
  end

  test "should destroy form_chaga" do
    assert_difference('FormChaga.count', -1) do
      delete :destroy, id: @form_chaga
    end

    assert_redirected_to form_chagas_path
  end
end
