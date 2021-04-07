module Api
  module V1
  class IdeasController < ApplicationController
    def index
      @ideas = Idea.all

      render json: @ideas
    end

    def create
      @idea = Idea.new(idea_params)

      if @idea.save
        render json: @idea, status: :created, location: @idea
      else
        render json: @idea.errors, status: :unprocessable_entity
      end
    end

    private

    def idea_params
      params.permit(:body).merge(category_id: params[:category_id])
    end
  end
 end 
end

