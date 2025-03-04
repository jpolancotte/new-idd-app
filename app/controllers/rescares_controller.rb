class RescaresController < ApplicationController
  before_action :set_rescare, only: %i[ show edit update destroy ]

  # GET /rescares or /rescares.json
  def index
    @rescares = Rescare.all
  end

  # GET /rescares/1 or /rescares/1.json
  def show
  end

  # GET /rescares/new
  def new
    @rescare = Rescare.new
  end

  # GET /rescares/1/edit
  def edit
  end

  # POST /rescares or /rescares.json
  def create
    @rescare = Rescare.new(rescare_params)

    respond_to do |format|
      if @rescare.save
        format.html { redirect_to rescare_url(@rescare), notice: "Rescare was successfully created." }
        format.json { render :show, status: :created, location: @rescare }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rescare.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rescares/1 or /rescares/1.json
  def update
    respond_to do |format|
      if @rescare.update(rescare_params)
        format.html { redirect_to rescare_url(@rescare), notice: "Rescare was successfully updated." }
        format.json { render :show, status: :ok, location: @rescare }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rescare.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rescares/1 or /rescares/1.json
  def destroy
    @rescare.destroy

    respond_to do |format|
      format.html { redirect_to rescares_url, notice: "Rescare was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rescare
      @rescare = Rescare.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rescare_params
      params.require(:rescare).permit(:name, :services, :address, :city, :state, :zip, :phone, :counties_served)
    end
end
