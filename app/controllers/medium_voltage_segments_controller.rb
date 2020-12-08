class MediumVoltageSegmentsController < ApplicationController
  before_action :set_medium_voltage_segment, only: [:show, :update, :destroy]

  # GET /medium_voltage_segments
  def index
    @medium_voltage_segments = MediumVoltageSegment.all

    render json: @medium_voltage_segments
  end

  # GET /medium_voltage_segments/1
  def show
    render json: @medium_voltage_segment
  end

  # POST /medium_voltage_segments
  def create
    @medium_voltage_segment = MediumVoltageSegment.new(medium_voltage_segment_params)

    if @medium_voltage_segment.save
      render json: @medium_voltage_segment, status: :created, location: @medium_voltage_segment
    else
      render json: @medium_voltage_segment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /medium_voltage_segments/1
  def update
    if @medium_voltage_segment.update(medium_voltage_segment_params)
      render json: @medium_voltage_segment
    else
      render json: @medium_voltage_segment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /medium_voltage_segments/1
  def destroy
    @medium_voltage_segment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medium_voltage_segment
      @medium_voltage_segment = MediumVoltageSegment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def medium_voltage_segment_params
      params.require(:medium_voltage_segment).permit(:cod_id, :descr, :pn_con_1, :pn_con_2, :ctmt, :uni_tr_s, :sub, :conj, :comp, :geometry)
    end
end
