class LowVoltageSegmentsController < ApplicationController
  before_action :set_low_voltage_segment, only: [:show, :update, :destroy]

  # GET /low_voltage_segments
  def index
    @low_voltage_segments = LowVoltageSegment.all

    render json: @low_voltage_segments
  end

  # GET /low_voltage_segments/1
  def show
    render json: @low_voltage_segment
  end

  # POST /low_voltage_segments
  def create
    @low_voltage_segment = LowVoltageSegment.new(low_voltage_segment_params)

    if @low_voltage_segment.save
      render json: @low_voltage_segment, status: :created, location: @low_voltage_segment
    else
      render json: @low_voltage_segment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /low_voltage_segments/1
  def update
    if @low_voltage_segment.update(low_voltage_segment_params)
      render json: @low_voltage_segment
    else
      render json: @low_voltage_segment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /low_voltage_segments/1
  def destroy
    @low_voltage_segment.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_low_voltage_segment
    @low_voltage_segment = LowVoltageSegment.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def low_voltage_segment_params
    params.require(:low_voltage_segment).permit(:cod_id, :descr, :pn_con_1, :pn_con_2, :ctmt, :uni_tr_s, :sub, :conj, :comp, :geometry)
  end
end
