require 'test_helper'

class NotablePointsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @notable_point = notable_points(:one)
  end

  test "should get index" do
    get notable_points_url, as: :json
    assert_response :success
  end

  test "should create notable_point" do
    assert_difference('NotablePoint.count') do
      post notable_points_url, params: { notable_point: { cod_id: @notable_point.cod_id, conj: @notable_point.conj, descr: @notable_point.descr, geometry: @notable_point.geometry } }, as: :json
    end

    assert_response 201
  end

  test "should show notable_point" do
    get notable_point_url(@notable_point), as: :json
    assert_response :success
  end

  test "should update notable_point" do
    patch notable_point_url(@notable_point), params: { notable_point: { cod_id: @notable_point.cod_id, conj: @notable_point.conj, descr: @notable_point.descr, geometry: @notable_point.geometry } }, as: :json
    assert_response 200
  end

  test "should destroy notable_point" do
    assert_difference('NotablePoint.count', -1) do
      delete notable_point_url(@notable_point), as: :json
    end

    assert_response 204
  end
end
