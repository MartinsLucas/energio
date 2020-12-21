class MediumVoltageCircuitsController < ApplicationController
  before_action :set_medium_voltage_circuit, only: [:show, :update, :destroy]

  # GET /medium_voltage_circuits
  def index
    @medium_voltage_circuits = MediumVoltageCircuit.all

    render json: @medium_voltage_circuits
  end

  # GET /medium_voltage_circuits/1
  def show
    render json: @medium_voltage_circuit
  end

  # POST /medium_voltage_circuits
  def create
    @medium_voltage_circuit = MediumVoltageCircuit.new(medium_voltage_circuit_params)

    if @medium_voltage_circuit.save
      render json: @medium_voltage_circuit, status: :created, location: @medium_voltage_circuit
    else
      render json: @medium_voltage_circuit.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /medium_voltage_circuits/1
  def update
    if @medium_voltage_circuit.update(medium_voltage_circuit_params)
      render json: @medium_voltage_circuit
    else
      render json: @medium_voltage_circuit.errors, status: :unprocessable_entity
    end
  end

  # DELETE /medium_voltage_circuits/1
  def destroy
    @medium_voltage_circuit.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_medium_voltage_circuit
    @medium_voltage_circuit = MediumVoltageCircuit.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def medium_voltage_circuit_params
    params.require(:medium_voltage_circuit).permit(:cod_id, :descr, :nom, :barr, :sub, :ten_nom, :ten_ope, :uni_tr_s)
  end
end
