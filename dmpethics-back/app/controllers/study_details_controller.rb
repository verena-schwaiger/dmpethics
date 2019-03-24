class StudyDetailsController < ApplicationController
  before_action :set_study_detail, only: [:show, :update, :destroy]

  # GET /study_details
  def index
    @study_details = StudyDetail.all

    render json: @study_details
  end

  # GET /study_details/1
  def show
    render json: @study_detail
  end

  # POST /study_details
  def create
    @study_detail = StudyDetail.new(study_detail_params)

    if @study_detail.save
      render json: @study_detail, status: :created, location: @study_detail
    else
      render json: @study_detail.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /study_details/1
  def update
    if @study_detail.update(study_detail_params)
      render json: @study_detail
    else
      render json: @study_detail.errors, status: :unprocessable_entity
    end
  end

  # DELETE /study_details/1
  def destroy
    @study_detail.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_study_detail
      @study_detail = StudyDetail.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def study_detail_params
      params.require(:study_detail).permit(:institution, :user_id, :researchgroup_id, :study_description, :study_id)
    end
end
