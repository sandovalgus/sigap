require 'test_helper'

class ClinicalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @clinical = clinicals(:one)
  end

  test "should get index" do
    get clinicals_url
    assert_response :success
  end

  test "should get new" do
    get new_clinical_url
    assert_response :success
  end

  test "should create clinical" do
    assert_difference('Clinical.count') do
      post clinicals_url, params: { clinical: { allergies: @clinical.allergies, background: @clinical.background, blood_type: @clinical.blood_type, clinical_analyzes: @clinical.clinical_analyzes, name_contact: @clinical.name_contact, name_social_work: @clinical.name_social_work, number_partner: @clinical.number_partner, tel_emergency: @clinical.tel_emergency } }
    end

    assert_redirected_to clinical_url(Clinical.last)
  end

  test "should show clinical" do
    get clinical_url(@clinical)
    assert_response :success
  end

  test "should get edit" do
    get edit_clinical_url(@clinical)
    assert_response :success
  end

  test "should update clinical" do
    patch clinical_url(@clinical), params: { clinical: { allergies: @clinical.allergies, background: @clinical.background, blood_type: @clinical.blood_type, clinical_analyzes: @clinical.clinical_analyzes, name_contact: @clinical.name_contact, name_social_work: @clinical.name_social_work, number_partner: @clinical.number_partner, tel_emergency: @clinical.tel_emergency } }
    assert_redirected_to clinical_url(@clinical)
  end

  test "should destroy clinical" do
    assert_difference('Clinical.count', -1) do
      delete clinical_url(@clinical)
    end

    assert_redirected_to clinicals_url
  end
end
