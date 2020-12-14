# frozen_string_literal: true

class GroupsController < ApplicationController
  before_action :set_group, only: %i[show]

  # GET /groups
  def index
    # print '#' * 30
    # puts 'Encontrando pontos...'
    # groups = Group.all
    # points = NotablePoint.where(conj: groups.first.cod_id).first(10)

    # count = points.count
    # print '#' * 30
    # print count
    # puts ' pontos encontrados.'

    # print '#' * 30
    # puts 'Iniciando montagem...'

    # collection = []
    # factory = RGeo::GeoJSON::EntityFactory.instance

    # print count
    # puts ' pontos restantes...'

    # groups.each do |group|
    #   properties = {}
    #   properties[:name] = group.nom if group.nom.present?
    #   properties[:description] = group.descr if group.descr.present?
    #   collection << factory.feature(group.geometry, group.cod_id, properties)
    # end

    # print '#' * 30
    # puts 'Iniciando conversao...'
    # feature_collection = RGeo::GeoJSON::FeatureCollection.new(collection)
    # hash = RGeo::GeoJSON.encode feature_collection

    # print '#' * 30
    # puts 'Conversao concluida. Renderizando json...'
    # render json: hash.to_json

    groups = Group.all

    feature = Group.create_rgeo_feature_colection(groups)
    render json: Group.genetrates_geojson(feature)
  end

  def show
    feature = @group&.create_rgeo_feature

    puts '#' * 30
    puts Group.genetrates_geojson(feature)
    puts '#' * 30

    render json: Group.genetrates_geojson(feature)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find_by(cod_id: params['id'])
  end

  # Only allow a trusted parameter "white list" through.
  def group_params
    params.require(:group).permit(:cod_id, :descr, :nom, :geometry)
  end
end
