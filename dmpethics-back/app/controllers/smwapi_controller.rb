class SmwapiController < ApplicationController
  include SmwapiHelper

  def create
    addStudy(params[:title], params[:country], params[:institution], params[:description])
  end
end
