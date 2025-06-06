class HsCompaniesController < ApplicationController
  before_action :set_hs_company, only: %i[ show edit update destroy ]

  # GET /hs_companies or /hs_companies.json
  def index
    @hs_companies = HsCompany.all
  end

  # GET /hs_companies/1 or /hs_companies/1.json
  def show
  end

  # GET /hs_companies/new
  def new
    @hs_company = HsCompany.new
  end

  # GET /hs_companies/1/edit
  def edit
  end

  # POST /hs_companies or /hs_companies.json
  def create
    @hs_company = HsCompany.new(hs_company_params)

    respond_to do |format|
      if @hs_company.save
        format.html { redirect_to hs_company_url(@hs_company), notice: "Hs company was successfully created." }
        format.json { render :show, status: :created, location: @hs_company }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hs_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hs_companies/1 or /hs_companies/1.json
  def update
    respond_to do |format|
      if @hs_company.update(hs_company_params)
        format.html { redirect_to hs_company_url(@hs_company), notice: "Hs company was successfully updated." }
        format.json { render :show, status: :ok, location: @hs_company }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hs_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hs_companies/1 or /hs_companies/1.json
  def destroy
    @hs_company.destroy

    respond_to do |format|
      format.html { redirect_to hs_companies_url, notice: "Hs company was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hs_company
      @hs_company = HsCompany.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hs_company_params
      params.require(:hs_company).permit(:name, :address, :city, :state, :zip, :primary_identifier, :hs_number, :website, :latitude, :longitude)
    end
end
