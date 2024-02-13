class HsContactsController < ApplicationController
  before_action :set_hs_contact, only: %i[ show edit update destroy ]

  # GET /hs_contacts or /hs_contacts.json
  def index
  
    if params[:location]
      @hs_contacts =  HsContact.near(params[:location], params[:distance])
    else
      @hs_contacts = HsContact.all.limit(100)
    end

  end

  # GET /hs_contacts/1 or /hs_contacts/1.json
  def show
  end

  # GET /hs_contacts/new
  def new
    @hs_contact = HsContact.new
  end

  # GET /hs_contacts/1/edit
  def edit
  end

  # POST /hs_contacts or /hs_contacts.json
  def create
    @hs_contact = HsContact.new(hs_contact_params)

    respond_to do |format|
      if @hs_contact.save
        format.html { redirect_to hs_contact_url(@hs_contact), notice: "Hs contact was successfully created." }
        format.json { render :show, status: :created, location: @hs_contact }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hs_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hs_contacts/1 or /hs_contacts/1.json
  def update
    respond_to do |format|
      if @hs_contact.update(hs_contact_params)
        format.html { redirect_to hs_contact_url(@hs_contact), notice: "Hs contact was successfully updated." }
        format.json { render :show, status: :ok, location: @hs_contact }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hs_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hs_contacts/1 or /hs_contacts/1.json
  def destroy
    @hs_contact.destroy

    respond_to do |format|
      format.html { redirect_to hs_contacts_url, notice: "Hs contact was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hs_contact
      @hs_contact = HsContact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hs_contact_params
      params.fetch(:hs_contact, {})
    end
end
