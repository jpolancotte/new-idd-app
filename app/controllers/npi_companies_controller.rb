class NpiCompaniesController < ApplicationController
  before_action :set_npi_company, only: %i[ show edit update destroy ]

  # GET /npi_companies or /npi_companies.json
  def index
    @npi_companies = NpiCompany.all.limit(500)
  end

  # GET /npi_companies/1 or /npi_companies/1.json
  def show
  end

  # GET /npi_companies/new
  def new
    @npi_company = NpiCompany.new
  end

  # GET /npi_companies/1/edit
  def edit
  end

  # POST /npi_companies or /npi_companies.json
  def create
    @npi_company = NpiCompany.new(npi_company_params)

    respond_to do |format|
      if @npi_company.save
        format.html { redirect_to npi_company_url(@npi_company), notice: "Npi company was successfully created." }
        format.json { render :show, status: :created, location: @npi_company }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @npi_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /npi_companies/1 or /npi_companies/1.json
  def update
    respond_to do |format|
      if @npi_company.update(npi_company_params)
        format.html { redirect_to npi_company_url(@npi_company), notice: "Npi company was successfully updated." }
        format.json { render :show, status: :ok, location: @npi_company }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @npi_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /npi_companies/1 or /npi_companies/1.json
  def destroy
    @npi_company.destroy

    respond_to do |format|
      format.html { redirect_to npi_companies_url, notice: "Npi company was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_npi_company
      @npi_company = NpiCompany.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def npi_company_params
      params.require(:npi_company).permit(:name, :number, :enumeration_date, :last_updated, :subpart, :status)
    end
end
