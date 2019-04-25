class SmwapiController < ApplicationController
  include SmwapiHelper

  # POST
  def create
    add_study(params[:id], params[:title], params[:country], params[:institution], params[:description])
    render json: {
        status: 200,
        message: "Success",
    }.to_json
  end

  # GET
  def index
    res = getExistingData(params[:id])
    render json: {
        status: 200,
        message: "Success",
        existingdata: res
    }.to_json

  end

  # DELETE /1/
  def destroy
    delete_study(params[:id])
    render json: {
      status: 200,
      message: "Success"
      }.to_json
  end

end
