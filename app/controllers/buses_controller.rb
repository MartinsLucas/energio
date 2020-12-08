class BusesController < ApplicationController
  before_action :set_bus, only: [:show, :update, :destroy]

  # GET /buses
  def index
    @buses = Bus.all

    render json: @buses
  end

  # GET /buses/1
  def show
    render json: @bus
  end

  # POST /buses
  def create
    @bus = Bus.new(bus_params)

    if @bus.save
      render json: @bus, status: :created, location: @bus
    else
      render json: @bus.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /buses/1
  def update
    if @bus.update(bus_params)
      render json: @bus
    else
      render json: @bus.errors, status: :unprocessable_entity
    end
  end

  # DELETE /buses/1
  def destroy
    @bus.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bus
      @bus = Bus.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bus_params
      params.require(:bus).permit(:cod_id, :descr, :sub, :ten_nom)
    end
end
