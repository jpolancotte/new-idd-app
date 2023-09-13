class StatesController < ApplicationController
  before_action :set_state, only: %i[ show edit update destroy ]

  def index
    @states = State.all.order(:name)
    @tte_states = State.active.order(:name)
    @non_tte_states = State.inactive.order(:name)
  end

  def show
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_state
    @state = State.find(params[:id])
  end

end
