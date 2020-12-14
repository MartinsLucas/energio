require 'test_helper'

class LowVoltageSegmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @low_voltage_segment = low_voltage_segments(:one)
  end

  test 'should get index' do
    get low_voltage_segments_url, as: :json
    assert_response :success
  end

  test 'should create low_voltage_segment' do
    assert_difference('LowVoltageSegment.count') do
      post low_voltage_segments_url, params: { low_voltage_segment: { cod_id: @low_voltage_segment.cod_id, comp: @low_voltage_segment.comp, conj: @low_voltage_segment.conj, ctmt: @low_voltage_segment.ctmt, descr: @low_voltage_segment.descr, geometry: @low_voltage_segment.geometry, pn_con_1: @low_voltage_segment.pn_con_1, pn_con_2: @low_voltage_segment.pn_con_2, sub: @low_voltage_segment.sub, uni_tr_s: @low_voltage_segment.uni_tr_s } }, as: :json
    end

    assert_response 201
  end

  test 'should show low_voltage_segment' do
    get low_voltage_segment_url(@low_voltage_segment), as: :json
    assert_response :success
  end

  test 'should update low_voltage_segment' do
    patch low_voltage_segment_url(@low_voltage_segment), params: { low_voltage_segment: { cod_id: @low_voltage_segment.cod_id, comp: @low_voltage_segment.comp, conj: @low_voltage_segment.conj, ctmt: @low_voltage_segment.ctmt, descr: @low_voltage_segment.descr, geometry: @low_voltage_segment.geometry, pn_con_1: @low_voltage_segment.pn_con_1, pn_con_2: @low_voltage_segment.pn_con_2, sub: @low_voltage_segment.sub, uni_tr_s: @low_voltage_segment.uni_tr_s } }, as: :json
    assert_response 200
  end

  test 'should destroy low_voltage_segment' do
    assert_difference('LowVoltageSegment.count', -1) do
      delete low_voltage_segment_url(@low_voltage_segment), as: :json
    end

    assert_response 204
  end
end
