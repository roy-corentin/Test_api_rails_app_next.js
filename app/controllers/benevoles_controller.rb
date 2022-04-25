class BenevolesController < ApplicationController
  before_action :set_benevole, only: [:show, :update, :destroy]

  # GET /benevoles
  def index
    @benevoles = Benevole.all

    render json: @benevoles
  end

  # GET /benevoles/1
  def show
    render json: @benevole
  end

  # POST /benevoles
  def create
    @benevole = Benevole.new(benevole_params)

    if @benevole.save
      render json: @benevole, status: :created, location: @benevole
    else
      render json: @benevole.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /benevoles/1
  def update
    if @benevole.update(benevole_params)
      render json: @benevole
    else
      render json: @benevole.errors, status: :unprocessable_entity
    end
  end

  # DELETE /benevoles/1
  def destroy
    @benevole.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_benevole
      @benevole = Benevole.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def benevole_params
      params.require(:benevole).permit(:firstName, :lastName, :email)
    end
end
