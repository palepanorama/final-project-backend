class AttorneysController < ApplicationController
  before_action :set_attorney, only: [:show, :update, :destroy]

  # GET /attorneys
  def index
    @attorneys = Attorney.all

    render json: @attorneys
  end

  # GET /attorneys/1
  def show
    render json: @attorney
  end

  # POST /attorneys
  def create
    @attorney = Attorney.new(attorney_params)

    if @attorney.save
      render json: @attorney, status: :created, location: @attorney
    else
      render json: @attorney.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /attorneys/1
  def update
    if @attorney.update(attorney_params)
      render json: @attorney
    else
      render json: @attorney.errors, status: :unprocessable_entity
    end
  end

  # DELETE /attorneys/1
  def destroy
    @attorney.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attorney
      @attorney = Attorney.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def attorney_params
      params.require(:attorney).permit(:name, :location, :description)
    end
end
