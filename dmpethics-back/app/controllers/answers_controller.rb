class AnswersController < ApplicationController
  include AnswersHelper
  before_action :set_answer, only: [:show, :update, :destroy]
  # GET /answers
  def index
    @answers = Answer.all
    render json: @answers
  end

  # GET /answers/1
  def show
    recommendations = Array.new
    if Answer.find(params['id']).topics != nil
      # Recommendation system: find all studies that share at least $ratio-limit topics
      studies = Answer.where.not(id: params['id'])
      topicarray = Answer.find(params['id']).topics.split(",")
      studies.each do |study|
        if study.topics.present?
          studyarray = study.topics.split(",")
          intersection = topicarray & studyarray
          ratio = intersection.size.to_f / studyarray.size
          if ratio > 0.4
              recommendations.push(study.id)
          end
        end
      end
    end
    #render json: @answer
    render json:{
      status: 200,
      study: @answer,
      recommendations: recommendations
    }
  end


  # POST /answers
  def create
    @answer = Answer.new(answer_params)

    if @answer.save
      render json: @answer, status: :created, location: @answer
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /answers/1
  def update
    #answer = Answer.find(params['id'])
    if @answer.update(answer_params)
      render json: @answer
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /answers/1
  def destroy
    @answer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def answer_params
      params.require(:answer).permit(:id, :study, :title, :data, :topics, :pid, :country, :institution, :authors, :ethics, :description)
    end
end


