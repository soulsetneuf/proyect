require 'test_helper'

class FormLiquidosControllerTest < ActionController::TestCase
  setup do
    @form_liquido = form_liquidos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:form_liquidos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create form_liquido" do
    assert_difference('FormLiquido.count') do
      post :create, form_liquido: { citologo: @form_liquido.citologo, conclusion: @form_liquido.conclusion, datos_impot: @form_liquido.datos_impot, diag_clinico: @form_liquido.diag_clinico, dr: @form_liquido.dr, fun: @form_liquido.fun, fup: @form_liquido.fup, hormonoterapia: @form_liquido.hormonoterapia, hospital_id: @form_liquido.hospital_id, medico_solicitante: @form_liquido.medico_solicitante, paciente_id: @form_liquido.paciente_id, radioterapia: @form_liquido.radioterapia, servicio: @form_liquido.servicio }
    end

    assert_redirected_to form_liquido_path(assigns(:form_liquido))
  end

  test "should show form_liquido" do
    get :show, id: @form_liquido
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @form_liquido
    assert_response :success
  end

  test "should update form_liquido" do
    patch :update, id: @form_liquido, form_liquido: { citologo: @form_liquido.citologo, conclusion: @form_liquido.conclusion, datos_impot: @form_liquido.datos_impot, diag_clinico: @form_liquido.diag_clinico, dr: @form_liquido.dr, fun: @form_liquido.fun, fup: @form_liquido.fup, hormonoterapia: @form_liquido.hormonoterapia, hospital_id: @form_liquido.hospital_id, medico_solicitante: @form_liquido.medico_solicitante, paciente_id: @form_liquido.paciente_id, radioterapia: @form_liquido.radioterapia, servicio: @form_liquido.servicio }
    assert_redirected_to form_liquido_path(assigns(:form_liquido))
  end

  test "should destroy form_liquido" do
    assert_difference('FormLiquido.count', -1) do
      delete :destroy, id: @form_liquido
    end

    assert_redirected_to form_liquidos_path
  end
end
