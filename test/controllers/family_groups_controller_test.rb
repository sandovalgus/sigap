require 'test_helper'

class FamilyGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @family_group = family_groups(:one)
  end

  test "should get index" do
    get family_groups_url
    assert_response :success
  end

  test "should get new" do
    get new_family_group_url
    assert_response :success
  end

  test "should create family_group" do
    assert_difference('FamilyGroup.count') do
      post family_groups_url, params: { family_group: { cuil: @family_group.cuil, document: @family_group.document, document_numbre: @family_group.document_numbre, family_ties: @family_group.family_ties, last_name: @family_group.last_name, name: @family_group.name, photocopy_document: @family_group.photocopy_document } }
    end

    assert_redirected_to family_group_url(FamilyGroup.last)
  end

  test "should show family_group" do
    get family_group_url(@family_group)
    assert_response :success
  end

  test "should get edit" do
    get edit_family_group_url(@family_group)
    assert_response :success
  end

  test "should update family_group" do
    patch family_group_url(@family_group), params: { family_group: { cuil: @family_group.cuil, document: @family_group.document, document_numbre: @family_group.document_numbre, family_ties: @family_group.family_ties, last_name: @family_group.last_name, name: @family_group.name, photocopy_document: @family_group.photocopy_document } }
    assert_redirected_to family_group_url(@family_group)
  end

  test "should destroy family_group" do
    assert_difference('FamilyGroup.count', -1) do
      delete family_group_url(@family_group)
    end

    assert_redirected_to family_groups_url
  end
end
