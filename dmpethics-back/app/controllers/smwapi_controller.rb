class SmwapiController < ApplicationController
  include SmwapiHelper

  def create
    addStudy(params[:id], params[:title], params[:country], params[:institution], params[:description])
    render json: {
        status: 200,
        message: "Success",
    }.to_json
  end

  def index
    res = getExistingData(params[:id])
    render json: {
        status: 200,
        message: "Success",
        existingdata: res
    }.to_json

  end
end
