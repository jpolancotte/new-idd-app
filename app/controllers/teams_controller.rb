class TeamsController < ApplicationController
  before_action :set_team, only: %i[ show edit update destroy ]

  def index
    @teams = Team.all
  end

  def show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_team
    @team = Team.find(params[:id])
  end

end
