# frozen_string_literal: true

class GroupsController < ApplicationController
  before_action :set_group, only: %i[show]

  # GET /groups
  def index
    groups = Group.all

    feature = Group.create_rgeo_feature_colection(groups)
    render json: Group.genetrates_geojson(feature).to_json
  end

  def show
    feature = @group&.create_rgeo_feature
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
