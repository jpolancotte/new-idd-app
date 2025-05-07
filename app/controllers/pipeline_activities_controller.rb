class PipelineActivitiesController < ApplicationController
  before_action :set_pipeline_activity, only: %i[ show edit update destroy ]

  # GET /pipeline_activities or /pipeline_activities.json
  def index
    # @pipeline_activities = PipelineActivity.all
    # @pipeline_activities = PipelineActivity.includes(:events).order("created_at ASC")
    @pipeline_activities = PipelineActivity.joins(:events).order("created_at DESC").distinct 

  end

  # GET /pipeline_activities/1 or /pipeline_activities/1.json
  def show

    @teams=Team.all.order("name ASC")

    if params[:team_id] 
      @deals = @pipeline_activity.deals.where(team_id: params[:team_id] ).order("updated_at DESC")
    else
      @deals = @pipeline_activity.deals 
    end
  end

  # GET /pipeline_activities/new
  def new
    @pipeline_activity = PipelineActivity.new
  end

  # GET /pipeline_activities/1/edit
  def edit
  end

  # POST /pipeline_activities or /pipeline_activities.json
  def create
    @pipeline_activity = PipelineActivity.new(pipeline_activity_params)

    respond_to do |format|
      if @pipeline_activity.save
        format.html { redirect_to pipeline_activity_url(@pipeline_activity), notice: "Pipeline activity was successfully created." }
        format.json { render :show, status: :created, location: @pipeline_activity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pipeline_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pipeline_activities/1 or /pipeline_activities/1.json
  def update
    respond_to do |format|
      if @pipeline_activity.update(pipeline_activity_params)
        format.html { redirect_to pipeline_activity_url(@pipeline_activity), notice: "Pipeline activity was successfully updated." }
        format.json { render :show, status: :ok, location: @pipeline_activity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pipeline_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pipeline_activities/1 or /pipeline_activities/1.json
  def destroy
    @pipeline_activity.destroy

    respond_to do |format|
      format.html { redirect_to pipeline_activities_url, notice: "Pipeline activity was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pipeline_activity
      @pipeline_activity = PipelineActivity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pipeline_activity_params
      params.require(:pipeline_activity).permit(:end_date, :start_date, :week_number)
    end
end
