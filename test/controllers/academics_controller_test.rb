require 'test_helper'

class AcademicsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @academic = academics(:one)
  end

  test "should get index" do
    get academics_url
    assert_response :success
  end

  test "should get new" do
    get new_academic_url
    assert_response :success
  end

  test "should create academic" do
    assert_difference('Academic.count') do
      post academics_url, params: { academic: { academic_training: @academic.academic_training, description: @academic.description, discipline: @academic.discipline, employees_id: @academic.employees_id, establishment: @academic.establishment, finish_data: @academic.finish_data, start_data: @academic.start_data, status: @academic.status } }
    end

    assert_redirected_to academic_url(Academic.last)
  end

  test "should show academic" do
    get academic_url(@academic)
    assert_response :success
  end

  test "should get edit" do
    get edit_academic_url(@academic)
    assert_response :success
  end

  test "should update academic" do
    patch academic_url(@academic), params: { academic: { academic_training: @academic.academic_training, description: @academic.description, discipline: @academic.discipline, employees_id: @academic.employees_id, establishment: @academic.establishment, finish_data: @academic.finish_data, start_data: @academic.start_data, status: @academic.status } }
    assert_redirected_to academic_url(@academic)
  end

  test "should destroy academic" do
    assert_difference('Academic.count', -1) do
      delete academic_url(@academic)
    end

    assert_redirected_to academics_url
  end
end
