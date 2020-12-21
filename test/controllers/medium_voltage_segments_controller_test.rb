require 'test_helper'

class MediumVoltageSegmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @medium_voltage_segment = medium_voltage_segments(:one)
  end

  test 'should get index' do
    get medium_voltage_segments_url, as: :json
    assert_response :success
  end

  test 'should create medium_voltage_segment' do
    assert_difference('MediumVoltageSegment.count') do
      post medium_voltage_segments_url, params: { medium_voltage_segment: { cod_id: @medium_voltage_segment.cod_id, comp: @medium_voltage_segment.comp, conj: @medium_voltage_segment.conj, ctmt: @medium_voltage_segment.ctmt, descr: @medium_voltage_segment.descr, geometry: @medium_voltage_segment.geometry, pn_con_1: @medium_voltage_segment.pn_con_1, pn_con_2: @medium_voltage_segment.pn_con_2, sub: @medium_voltage_segment.sub, uni_tr_s: @medium_voltage_segment.uni_tr_s } }, as: :json
    end

    assert_response 201
  end

  test 'should show medium_voltage_segment' do
    get medium_voltage_segment_url(@medium_voltage_segment), as: :json
    assert_response :success
  end

  test 'should update medium_voltage_segment' do
    patch medium_voltage_segment_url(@medium_voltage_segment), params: { medium_voltage_segment: { cod_id: @medium_voltage_segment.cod_id, comp: @medium_voltage_segment.comp, conj: @medium_voltage_segment.conj, ctmt: @medium_voltage_segment.ctmt, descr: @medium_voltage_segment.descr, geometry: @medium_voltage_segment.geometry, pn_con_1: @medium_voltage_segment.pn_con_1, pn_con_2: @medium_voltage_segment.pn_con_2, sub: @medium_voltage_segment.sub, uni_tr_s: @medium_voltage_segment.uni_tr_s } }, as: :json
    assert_response 200
  end

  test 'should destroy medium_voltage_segment' do
    assert_difference('MediumVoltageSegment.count', -1) do
      delete medium_voltage_segment_url(@medium_voltage_segment), as: :json
    end

    assert_response 204
  end
end
