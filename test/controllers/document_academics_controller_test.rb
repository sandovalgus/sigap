require 'test_helper'

class DocumentAcademicsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @document_academic = document_academics(:one)
  end

  test "should get index" do
    get document_academics_url
    assert_response :success
  end

  test "should get new" do
    get new_document_academic_url
    assert_response :success
  end

  test "should create document_academic" do
    assert_difference('DocumentAcademic.count') do
      post document_academics_url, params: { document_academic: { academic_id: @document_academic.academic_id, commentary: @document_academic.commentary, document: @document_academic.document } }
    end

    assert_redirected_to document_academic_url(DocumentAcademic.last)
  end

  test "should show document_academic" do
    get document_academic_url(@document_academic)
    assert_response :success
  end

  test "should get edit" do
    get edit_document_academic_url(@document_academic)
    assert_response :success
  end

  test "should update document_academic" do
    patch document_academic_url(@document_academic), params: { document_academic: { academic_id: @document_academic.academic_id, commentary: @document_academic.commentary, document: @document_academic.document } }
    assert_redirected_to document_academic_url(@document_academic)
  end

  test "should destroy document_academic" do
    assert_difference('DocumentAcademic.count', -1) do
      delete document_academic_url(@document_academic)
    end

    assert_redirected_to document_academics_url
  end
end
