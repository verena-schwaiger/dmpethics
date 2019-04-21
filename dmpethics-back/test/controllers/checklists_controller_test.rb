require 'test_helper'

class ChecklistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @checklist = checklists(:one)
  end

  test "should get index" do
    get checklists_url, as: :json
    assert_response :success
  end

  test "should create checklist" do
    assert_difference('Checklist.count') do
      post checklists_url, params: { checklist: { list: @checklist.list, study_id: @checklist.study_id } }, as: :json
    end

    assert_response 201
  end

  test "should show checklist" do
    get checklist_url(@checklist), as: :json
    assert_response :success
  end

  test "should update checklist" do
    patch checklist_url(@checklist), params: { checklist: { list: @checklist.list, study_id: @checklist.study_id } }, as: :json
    assert_response 200
  end

  test "should destroy checklist" do
    assert_difference('Checklist.count', -1) do
      delete checklist_url(@checklist), as: :json
    end

    assert_response 204
  end
end
