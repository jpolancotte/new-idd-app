class TteServicingPharmaciesController < ApplicationController
  before_action :set_tte_servicing_pharmacy, only: %i[ show edit update destroy ]

  # GET /tte_servicing_pharmacies or /tte_servicing_pharmacies.json
  def index
    @tte_servicing_pharmacies = TteServicingPharmacy.all
  end

  # GET /tte_servicing_pharmacies/1 or /tte_servicing_pharmacies/1.json
  def show
  end

  # GET /tte_servicing_pharmacies/new
  def new
    @tte_servicing_pharmacy = TteServicingPharmacy.new
  end

  # GET /tte_servicing_pharmacies/1/edit
  def edit
  end

  # POST /tte_servicing_pharmacies or /tte_servicing_pharmacies.json
  def create
    @tte_servicing_pharmacy = TteServicingPharmacy.new(tte_servicing_pharmacy_params)

    respond_to do |format|
      if @tte_servicing_pharmacy.save
        format.html { redirect_to tte_servicing_pharmacy_url(@tte_servicing_pharmacy), notice: "Tte servicing pharmacy was successfully created." }
        format.json { render :show, status: :created, location: @tte_servicing_pharmacy }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tte_servicing_pharmacy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tte_servicing_pharmacies/1 or /tte_servicing_pharmacies/1.json
  def update
    respond_to do |format|
      if @tte_servicing_pharmacy.update(tte_servicing_pharmacy_params)
        format.html { redirect_to tte_servicing_pharmacy_url(@tte_servicing_pharmacy), notice: "Tte servicing pharmacy was successfully updated." }
        format.json { render :show, status: :ok, location: @tte_servicing_pharmacy }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tte_servicing_pharmacy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tte_servicing_pharmacies/1 or /tte_servicing_pharmacies/1.json
  def destroy
    @tte_servicing_pharmacy.destroy

    respond_to do |format|
      format.html { redirect_to tte_servicing_pharmacies_url, notice: "Tte servicing pharmacy was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tte_servicing_pharmacy
      @tte_servicing_pharmacy = TteServicingPharmacy.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tte_servicing_pharmacy_params
      params.require(:tte_servicing_pharmacy).permit(:name, :pharmid, :street1, :street2, :city, :state_id, :zip, :phone)
    end
end
