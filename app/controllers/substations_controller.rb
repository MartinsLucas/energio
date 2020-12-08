class SubstationsController < ApplicationController
  before_action :set_substation, only: [:show, :update, :destroy]

  # GET /substations
  def index
    @substations = Substation.all

    render json: @substations
  end

  # GET /substations/1
  def show
    render json: @substation
  end

  # POST /substations
  def create
    @substation = Substation.new(substation_params)

    if @substation.save
      render json: @substation, status: :created, location: @substation
    else
      render json: @substation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /substations/1
  def update
    if @substation.update(substation_params)
      render json: @substation
    else
      render json: @substation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /substations/1
  def destroy
    @substation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_substation
      @substation = Substation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def substation_params
      params.require(:substation).permit(:cod_id, :descr, :nom, :geometry)
    end
end
