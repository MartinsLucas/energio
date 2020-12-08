class SubstationTransformerUnitsController < ApplicationController
  before_action :set_substation_transformer_unit, only: [:show, :update, :destroy]

  # GET /substation_transformer_units
  def index
    @substation_transformer_units = SubstationTransformerUnit.all

    render json: @substation_transformer_units
  end

  # GET /substation_transformer_units/1
  def show
    render json: @substation_transformer_unit
  end

  # POST /substation_transformer_units
  def create
    @substation_transformer_unit = SubstationTransformerUnit.new(substation_transformer_unit_params)

    if @substation_transformer_unit.save
      render json: @substation_transformer_unit, status: :created, location: @substation_transformer_unit
    else
      render json: @substation_transformer_unit.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /substation_transformer_units/1
  def update
    if @substation_transformer_unit.update(substation_transformer_unit_params)
      render json: @substation_transformer_unit
    else
      render json: @substation_transformer_unit.errors, status: :unprocessable_entity
    end
  end

  # DELETE /substation_transformer_units/1
  def destroy
    @substation_transformer_unit.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_substation_transformer_unit
      @substation_transformer_unit = SubstationTransformerUnit.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def substation_transformer_unit_params
      params.require(:substation_transformer_unit).permit(:cod_id, :descr, :barr_1, :barr_2, :barr_3, :sub, :pot_nom, :geometry)
    end
end
