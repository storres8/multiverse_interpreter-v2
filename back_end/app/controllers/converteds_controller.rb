class ConvertedsController < ApplicationController
  before_action :set_converted, only: [:show, :update, :destroy]

  # GET /converteds
  def index
    @converteds = Converted.all

    render json: @converteds
  end

  # GET /converteds/1
  def show
    render json: @converted
  end

  # POST /converteds
  def create
    @converted = Converted.new(converted_params)

    if @converted.save
      render json: @converted, status: :created, location: @converted
    else
      render json: @converted.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /converteds/1
  def update
    if @converted.update(converted_params)
      render json: @converted
    else
      render json: @converted.errors, status: :unprocessable_entity
    end
  end

  # DELETE /converteds/1
  def destroy
    @converted.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_converted
      @converted = Converted.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def converted_params
      params.require(:converted).permit(:gif_url, :team, :universe_id, :time_warning, :compatibility, :user_id, :description)
    end
end