require 'test_helper'

class FormCancerUterinosControllerTest < ActionController::TestCase
  setup do
    @form_cancer_uterino = form_cancer_uterinos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:form_cancer_uterinos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create form_cancer_uterino" do
    assert_difference('FormCancerUterino.count') do
      post :create, form_cancer_uterino: { aspecto_cuello: @form_cancer_uterino.aspecto_cuello, control: @form_cancer_uterino.control, criocirug_hormonal: @form_cancer_uterino.criocirug_hormonal, depo: @form_cancer_uterino.depo, dia_termo: @form_cancer_uterino.dia_termo, embarazo: @form_cancer_uterino.embarazo, estado_lactancia: @form_cancer_uterino.estado_lactancia, fecha_aborto: @form_cancer_uterino.fecha_aborto, fecha_entrega: @form_cancer_uterino.fecha_entrega, fecha_ult_menstruacion: @form_cancer_uterino.fecha_ult_menstruacion, fecha_ult_parto: @form_cancer_uterino.fecha_ult_parto, flujo_vaginal: @form_cancer_uterino.flujo_vaginal, hospital_id: @form_cancer_uterino.hospital_id, informacion_toma_muestra: @form_cancer_uterino.informacion_toma_muestra, ligadura_trompas: @form_cancer_uterino.ligadura_trompas, lugar_de_muestra: @form_cancer_uterino.lugar_de_muestra, menopausia: @form_cancer_uterino.menopausia, n_abortos: @form_cancer_uterino.n_abortos, n_cesareas: @form_cancer_uterino.n_cesareas, n_emabarazos: @form_cancer_uterino.n_emabarazos, nivel_social: @form_cancer_uterino.nivel_social, nro: @form_cancer_uterino.nro, oral: @form_cancer_uterino.oral, otros: @form_cancer_uterino.otros, paciente_id: @form_cancer_uterino.paciente_id, ritmo: @form_cancer_uterino.ritmo, sin_tratamiento: @form_cancer_uterino.sin_tratamiento }
    end

    assert_redirected_to form_cancer_uterino_path(assigns(:form_cancer_uterino))
  end

  test "should show form_cancer_uterino" do
    get :show, id: @form_cancer_uterino
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @form_cancer_uterino
    assert_response :success
  end

  test "should update form_cancer_uterino" do
    patch :update, id: @form_cancer_uterino, form_cancer_uterino: { aspecto_cuello: @form_cancer_uterino.aspecto_cuello, control: @form_cancer_uterino.control, criocirug_hormonal: @form_cancer_uterino.criocirug_hormonal, depo: @form_cancer_uterino.depo, dia_termo: @form_cancer_uterino.dia_termo, embarazo: @form_cancer_uterino.embarazo, estado_lactancia: @form_cancer_uterino.estado_lactancia, fecha_aborto: @form_cancer_uterino.fecha_aborto, fecha_entrega: @form_cancer_uterino.fecha_entrega, fecha_ult_menstruacion: @form_cancer_uterino.fecha_ult_menstruacion, fecha_ult_parto: @form_cancer_uterino.fecha_ult_parto, flujo_vaginal: @form_cancer_uterino.flujo_vaginal, hospital_id: @form_cancer_uterino.hospital_id, informacion_toma_muestra: @form_cancer_uterino.informacion_toma_muestra, ligadura_trompas: @form_cancer_uterino.ligadura_trompas, lugar_de_muestra: @form_cancer_uterino.lugar_de_muestra, menopausia: @form_cancer_uterino.menopausia, n_abortos: @form_cancer_uterino.n_abortos, n_cesareas: @form_cancer_uterino.n_cesareas, n_emabarazos: @form_cancer_uterino.n_emabarazos, nivel_social: @form_cancer_uterino.nivel_social, nro: @form_cancer_uterino.nro, oral: @form_cancer_uterino.oral, otros: @form_cancer_uterino.otros, paciente_id: @form_cancer_uterino.paciente_id, ritmo: @form_cancer_uterino.ritmo, sin_tratamiento: @form_cancer_uterino.sin_tratamiento }
    assert_redirected_to form_cancer_uterino_path(assigns(:form_cancer_uterino))
  end

  test "should destroy form_cancer_uterino" do
    assert_difference('FormCancerUterino.count', -1) do
      delete :destroy, id: @form_cancer_uterino
    end

    assert_redirected_to form_cancer_uterinos_path
  end
end
