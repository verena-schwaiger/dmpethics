class ChecklistsController < ApplicationController
  before_action :set_checklist, only: [:show, :update, :destroy]

  # GET /checklists
  def index
    @checklists = Checklist.all

    render json: @checklists
  end

  # GET /checklists/1
  def show
    render json: @checklist
  end

  # POST /checklists
  def create
    @checklist = Checklist.new(checklist_params)

    if @checklist.save
      render json: @checklist, status: :created, location: @checklist
    else
      render json: @checklist.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /checklists/1
  def update
    if @checklist.update(checklist_params)
      render json: @checklist
    else
      render json: @checklist.errors, status: :unprocessable_entity
    end
  end

  # DELETE /checklists/1
  def destroy
    @checklist.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checklist
      @checklist = Checklist.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def checklist_params
      params.require(:checklist).permit(:study_id, :list)
    end
end
