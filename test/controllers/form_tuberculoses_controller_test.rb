require 'test_helper'

class FormTuberculosesControllerTest < ActionController::TestCase
  setup do
    @form_tuberculose = form_tuberculoses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:form_tuberculoses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create form_tuberculose" do
    assert_difference('FormTuberculosis.count') do
      post :create, form_tuberculose: { hospital_id: @form_tuberculose.hospital_id, paciente_id: @form_tuberculose.paciente_id }
    end

    assert_redirected_to form_tuberculose_path(assigns(:form_tuberculose))
  end

  test "should show form_tuberculose" do
    get :show, id: @form_tuberculose
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @form_tuberculose
    assert_response :success
  end

  test "should update form_tuberculose" do
    patch :update, id: @form_tuberculose, form_tuberculose: { hospital_id: @form_tuberculose.hospital_id, paciente_id: @form_tuberculose.paciente_id }
    assert_redirected_to form_tuberculose_path(assigns(:form_tuberculose))
  end

  test "should destroy form_tuberculose" do
    assert_difference('FormTuberculosis.count', -1) do
      delete :destroy, id: @form_tuberculose
    end

    assert_redirected_to form_tuberculoses_path
  end
end
