# frozen_string_literal: true

class EntitiesController < ApplicationController
  include EnergioConstants
  before_action :set_class

  def index
    geojson = {}
    if @target_class
      entities = @target_class.where(conj: params[:group_id])
  
      feature = @target_class.create_rgeo_feature_colection(entities)
      geojson = @target_class.genetrates_geojson(feature)
    end
    render json: geojson.to_json
  end

  def show
    geojson = {}
    if @target_class
      entity = @target_class.find_by(cod_id: params['id'])
      feature = entity&.create_rgeo_feature
      geojson = Group.genetrates_geojson(feature)
    end
    render json: geojson.to_json
  end

  private

  def set_class
    class_name = params[:class_name]

    @target_class = if VALID_ENTITIES.include? class_name.to_s
        class_name.constantize 
      else
        nil
      end
  end
end
