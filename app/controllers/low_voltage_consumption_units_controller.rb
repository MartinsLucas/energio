class LowVoltageConsumptionUnitsController < ApplicationController
  before_action :set_low_voltage_consumption_unit, only: [:show, :update, :destroy]

  # GET /low_voltage_consumption_units
  def index
    @low_voltage_consumption_units = LowVoltageConsumptionUnit.all

    render json: @low_voltage_consumption_units
  end

  # GET /low_voltage_consumption_units/1
  def show
    render json: @low_voltage_consumption_unit
  end

  # POST /low_voltage_consumption_units
  def create
    @low_voltage_consumption_unit = LowVoltageConsumptionUnit.new(low_voltage_consumption_unit_params)

    if @low_voltage_consumption_unit.save
      render json: @low_voltage_consumption_unit, status: :created, location: @low_voltage_consumption_unit
    else
      render json: @low_voltage_consumption_unit.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /low_voltage_consumption_units/1
  def update
    if @low_voltage_consumption_unit.update(low_voltage_consumption_unit_params)
      render json: @low_voltage_consumption_unit
    else
      render json: @low_voltage_consumption_unit.errors, status: :unprocessable_entity
    end
  end

  # DELETE /low_voltage_consumption_units/1
  def destroy
    @low_voltage_consumption_unit.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_low_voltage_consumption_unit
      @low_voltage_consumption_unit = LowVoltageConsumptionUnit.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def low_voltage_consumption_unit_params
      params.require(:low_voltage_consumption_unit).permit(:descr, :pn_con, :ctmt, :uni_tr_s, :sub, :conj, :mun, :brr, :cep, :cnae, :tip_cc, :fas_con, :gru_ten, :ten_forn, :gru_tar, :dat_con, :car_inst, :liv, :dic, :fic, :are_loc, :geometry)
    end
end
