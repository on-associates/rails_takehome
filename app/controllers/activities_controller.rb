class ActivitiesController < ApplicationController
  before_action :set_activity, only: %i[ show edit update destroy ]

  # GET /activities or /activities.json
  def index
    @activities = Activity.all
  end

  # GET /activities/1 or /activities/1.json
  def show
  end

  # GET /activities/new
  def new
    wizard = Wizard.new(Activity, session, params).start
    @activity = wizard.object
  end

  # GET /activities/1/edit
  def edit
    @activity = Activity.find_by(id: params[:id])
    wizard = Wizard.new(@activity, session, params).start
  end

  # POST /activities or /activities.json
  def create
    @wizard = Wizard.new(Activity, session, params, activity_params).continue
    @activity = @wizard.object

    if @wizard.save
      redirect_to activities_path, notice: 'Activity created'
    else
      render :new
    end
  end

  # PATCH/PUT /activities/1 or /activities/1.json
  def update
    @wizard = Wizard.new(Activity, session, params, activity_params).continue
    @activity = @wizard.object

    if @wizard.save
      redirect_to activities_path, notice: 'Activity updated'
    else
      render :edit
    end
  end

  # DELETE /activities/1 or /activities/1.json
  def destroy
    @activity.destroy

    respond_to do |format|
      format.html { redirect_to activities_url, notice: "Activity was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def activity_params
      return params unless params[:activity]

      params.require(:activity).permit(:current_step, :name, :address, :starts_at, :ends_at)
    end
end
