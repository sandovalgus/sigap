require 'test_helper'

class GeneralDirectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @general_direction = general_directions(:one)
  end

  test "should get index" do
    get general_directions_url
    assert_response :success
  end

  test "should get new" do
    get new_general_direction_url
    assert_response :success
  end

  test "should create general_direction" do
    assert_difference('GeneralDirection.count') do
      post general_directions_url, params: { general_direction: { department_id: @general_direction.department_id, direction_id: @general_direction.direction_id, name: @general_direction.name } }
    end

    assert_redirected_to general_direction_url(GeneralDirection.last)
  end

  test "should show general_direction" do
    get general_direction_url(@general_direction)
    assert_response :success
  end

  test "should get edit" do
    get edit_general_direction_url(@general_direction)
    assert_response :success
  end

  test "should update general_direction" do
    patch general_direction_url(@general_direction), params: { general_direction: { department_id: @general_direction.department_id, direction_id: @general_direction.direction_id, name: @general_direction.name } }
    assert_redirected_to general_direction_url(@general_direction)
  end

  test "should destroy general_direction" do
    assert_difference('GeneralDirection.count', -1) do
      delete general_direction_url(@general_direction)
    end

    assert_redirected_to general_directions_url
  end
end
