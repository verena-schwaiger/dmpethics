require 'test_helper'

class StudyDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @study_detail = study_details(:one)
  end

  test "should get index" do
    get study_details_url, as: :json
    assert_response :success
  end

  test "should create study_detail" do
    assert_difference('StudyDetail.count') do
      post study_details_url, params: { study_detail: { institution: @study_detail.institution, researchgroup_id: @study_detail.researchgroup_id, study_description: @study_detail.study_description, study_id: @study_detail.study_id, user_id: @study_detail.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show study_detail" do
    get study_detail_url(@study_detail), as: :json
    assert_response :success
  end

  test "should update study_detail" do
    patch study_detail_url(@study_detail), params: { study_detail: { institution: @study_detail.institution, researchgroup_id: @study_detail.researchgroup_id, study_description: @study_detail.study_description, study_id: @study_detail.study_id, user_id: @study_detail.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy study_detail" do
    assert_difference('StudyDetail.count', -1) do
      delete study_detail_url(@study_detail), as: :json
    end

    assert_response 204
  end
end
