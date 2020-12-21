require 'test_helper'

class SubstationTransformerUnitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @substation_transformer_unit = substation_transformer_units(:one)
  end

  test 'should get index' do
    get substation_transformer_units_url, as: :json
    assert_response :success
  end

  test 'should create substation_transformer_unit' do
    assert_difference('SubstationTransformerUnit.count') do
      post substation_transformer_units_url, params: { substation_transformer_unit: { barr_1: @substation_transformer_unit.barr_1, barr_2: @substation_transformer_unit.barr_2, barr_3: @substation_transformer_unit.barr_3, cod_id: @substation_transformer_unit.cod_id, descr: @substation_transformer_unit.descr, geometry: @substation_transformer_unit.geometry, pot_nom: @substation_transformer_unit.pot_nom, sub: @substation_transformer_unit.sub } }, as: :json
    end

    assert_response 201
  end

  test 'should show substation_transformer_unit' do
    get substation_transformer_unit_url(@substation_transformer_unit), as: :json
    assert_response :success
  end

  test 'should update substation_transformer_unit' do
    patch substation_transformer_unit_url(@substation_transformer_unit), params: { substation_transformer_unit: { barr_1: @substation_transformer_unit.barr_1, barr_2: @substation_transformer_unit.barr_2, barr_3: @substation_transformer_unit.barr_3, cod_id: @substation_transformer_unit.cod_id, descr: @substation_transformer_unit.descr, geometry: @substation_transformer_unit.geometry, pot_nom: @substation_transformer_unit.pot_nom, sub: @substation_transformer_unit.sub } }, as: :json
    assert_response 200
  end

  test 'should destroy substation_transformer_unit' do
    assert_difference('SubstationTransformerUnit.count', -1) do
      delete substation_transformer_unit_url(@substation_transformer_unit), as: :json
    end

    assert_response 204
  end
end
