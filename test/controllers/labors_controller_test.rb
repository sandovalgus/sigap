require 'test_helper'

class LaborsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @labor = labors(:one)
  end

  test "should get index" do
    get labors_url
    assert_response :success
  end

  test "should get new" do
    get new_labor_url
    assert_response :success
  end

  test "should create labor" do
    assert_difference('Labor.count') do
      post labors_url, params: { labor: { category: @labor.category, department: @labor.department, departure_date: @labor.departure_date, employee_id: @labor.employee_id, entry_date: @labor.entry_date, function: @labor.function, section: @labor.section, status: @labor.status } }
    end

    assert_redirected_to labor_url(Labor.last)
  end

  test "should show labor" do
    get labor_url(@labor)
    assert_response :success
  end

  test "should get edit" do
    get edit_labor_url(@labor)
    assert_response :success
  end

  test "should update labor" do
    patch labor_url(@labor), params: { labor: { category: @labor.category, department: @labor.department, departure_date: @labor.departure_date, employee_id: @labor.employee_id, entry_date: @labor.entry_date, function: @labor.function, section: @labor.section, status: @labor.status } }
    assert_redirected_to labor_url(@labor)
  end

  test "should destroy labor" do
    assert_difference('Labor.count', -1) do
      delete labor_url(@labor)
    end

    assert_redirected_to labors_url
  end
end
