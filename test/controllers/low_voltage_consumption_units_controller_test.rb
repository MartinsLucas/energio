require 'test_helper'

class LowVoltageConsumptionUnitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @low_voltage_consumption_unit = low_voltage_consumption_units(:one)
  end

  test 'should get index' do
    get low_voltage_consumption_units_url, as: :json
    assert_response :success
  end

  test 'should create low_voltage_consumption_unit' do
    assert_difference('LowVoltageConsumptionUnit.count') do
      post low_voltage_consumption_units_url, params: { low_voltage_consumption_unit: { are_loc: @low_voltage_consumption_unit.are_loc, brr: @low_voltage_consumption_unit.brr, car_inst: @low_voltage_consumption_unit.car_inst, cep: @low_voltage_consumption_unit.cep, cnae: @low_voltage_consumption_unit.cnae, conj: @low_voltage_consumption_unit.conj, ctmt: @low_voltage_consumption_unit.ctmt, dat_con: @low_voltage_consumption_unit.dat_con, descr: @low_voltage_consumption_unit.descr, dic: @low_voltage_consumption_unit.dic, fas_con: @low_voltage_consumption_unit.fas_con, fic: @low_voltage_consumption_unit.fic, geometry: @low_voltage_consumption_unit.geometry, gru_tar: @low_voltage_consumption_unit.gru_tar, gru_ten: @low_voltage_consumption_unit.gru_ten, liv: @low_voltage_consumption_unit.liv, mun: @low_voltage_consumption_unit.mun, pn_con: @low_voltage_consumption_unit.pn_con, sub: @low_voltage_consumption_unit.sub, ten_forn: @low_voltage_consumption_unit.ten_forn, tip_cc: @low_voltage_consumption_unit.tip_cc, uni_tr_s: @low_voltage_consumption_unit.uni_tr_s } }, as: :json
    end

    assert_response 201
  end

  test 'should show low_voltage_consumption_unit' do
    get low_voltage_consumption_unit_url(@low_voltage_consumption_unit), as: :json
    assert_response :success
  end

  test 'should update low_voltage_consumption_unit' do
    patch low_voltage_consumption_unit_url(@low_voltage_consumption_unit), params: { low_voltage_consumption_unit: { are_loc: @low_voltage_consumption_unit.are_loc, brr: @low_voltage_consumption_unit.brr, car_inst: @low_voltage_consumption_unit.car_inst, cep: @low_voltage_consumption_unit.cep, cnae: @low_voltage_consumption_unit.cnae, conj: @low_voltage_consumption_unit.conj, ctmt: @low_voltage_consumption_unit.ctmt, dat_con: @low_voltage_consumption_unit.dat_con, descr: @low_voltage_consumption_unit.descr, dic: @low_voltage_consumption_unit.dic, fas_con: @low_voltage_consumption_unit.fas_con, fic: @low_voltage_consumption_unit.fic, geometry: @low_voltage_consumption_unit.geometry, gru_tar: @low_voltage_consumption_unit.gru_tar, gru_ten: @low_voltage_consumption_unit.gru_ten, liv: @low_voltage_consumption_unit.liv, mun: @low_voltage_consumption_unit.mun, pn_con: @low_voltage_consumption_unit.pn_con, sub: @low_voltage_consumption_unit.sub, ten_forn: @low_voltage_consumption_unit.ten_forn, tip_cc: @low_voltage_consumption_unit.tip_cc, uni_tr_s: @low_voltage_consumption_unit.uni_tr_s } }, as: :json
    assert_response 200
  end

  test 'should destroy low_voltage_consumption_unit' do
    assert_difference('LowVoltageConsumptionUnit.count', -1) do
      delete low_voltage_consumption_unit_url(@low_voltage_consumption_unit), as: :json
    end

    assert_response 204
  end
end
