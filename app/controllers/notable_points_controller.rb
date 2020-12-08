class NotablePointsController < ApplicationController
  before_action :set_notable_point, only: [:show, :update, :destroy]

  # GET /notable_points
  def index
    @notable_points = NotablePoint.all

    render json: @notable_points
  end

  # GET /notable_points/1
  def show
    render json: @notable_point
  end

  # POST /notable_points
  def create
    @notable_point = NotablePoint.new(notable_point_params)

    if @notable_point.save
      render json: @notable_point, status: :created, location: @notable_point
    else
      render json: @notable_point.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /notable_points/1
  def update
    if @notable_point.update(notable_point_params)
      render json: @notable_point
    else
      render json: @notable_point.errors, status: :unprocessable_entity
    end
  end

  # DELETE /notable_points/1
  def destroy
    @notable_point.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notable_point
      @notable_point = NotablePoint.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def notable_point_params
      params.require(:notable_point).permit(:cod_id, :descr, :conj, :geometry)
    end
end
