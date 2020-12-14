require 'test_helper'

class MediumVoltageCircuitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @medium_voltage_circuit = medium_voltage_circuits(:one)
  end

  test 'should get index' do
    get medium_voltage_circuits_url, as: :json
    assert_response :success
  end

  test 'should create medium_voltage_circuit' do
    assert_difference('MediumVoltageCircuit.count') do
      post medium_voltage_circuits_url, params: { medium_voltage_circuit: { barr: @medium_voltage_circuit.barr, cod_id: @medium_voltage_circuit.cod_id, descr: @medium_voltage_circuit.descr, nom: @medium_voltage_circuit.nom, sub: @medium_voltage_circuit.sub, ten_nom: @medium_voltage_circuit.ten_nom, ten_ope: @medium_voltage_circuit.ten_ope, uni_tr_s: @medium_voltage_circuit.uni_tr_s } }, as: :json
    end

    assert_response 201
  end

  test 'should show medium_voltage_circuit' do
    get medium_voltage_circuit_url(@medium_voltage_circuit), as: :json
    assert_response :success
  end

  test 'should update medium_voltage_circuit' do
    patch medium_voltage_circuit_url(@medium_voltage_circuit), params: { medium_voltage_circuit: { barr: @medium_voltage_circuit.barr, cod_id: @medium_voltage_circuit.cod_id, descr: @medium_voltage_circuit.descr, nom: @medium_voltage_circuit.nom, sub: @medium_voltage_circuit.sub, ten_nom: @medium_voltage_circuit.ten_nom, ten_ope: @medium_voltage_circuit.ten_ope, uni_tr_s: @medium_voltage_circuit.uni_tr_s } }, as: :json
    assert_response 200
  end

  test 'should destroy medium_voltage_circuit' do
    assert_difference('MediumVoltageCircuit.count', -1) do
      delete medium_voltage_circuit_url(@medium_voltage_circuit), as: :json
    end

    assert_response 204
  end
end
