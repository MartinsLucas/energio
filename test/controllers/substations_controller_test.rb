require 'test_helper'

class SubstationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @substation = substations(:one)
  end

  test 'should get index' do
    get substations_url, as: :json
    assert_response :success
  end

  test 'should create substation' do
    assert_difference('Substation.count') do
      post substations_url, params: { substation: { cod_id: @substation.cod_id, descr: @substation.descr, geometry: @substation.geometry, nom: @substation.nom } }, as: :json
    end

    assert_response 201
  end

  test 'should show substation' do
    get substation_url(@substation), as: :json
    assert_response :success
  end

  test 'should update substation' do
    patch substation_url(@substation), params: { substation: { cod_id: @substation.cod_id, descr: @substation.descr, geometry: @substation.geometry, nom: @substation.nom } }, as: :json
    assert_response 200
  end

  test 'should destroy substation' do
    assert_difference('Substation.count', -1) do
      delete substation_url(@substation), as: :json
    end

    assert_response 204
  end
end
