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
    params.require(:idea).permit(:catagory_id,:body)
  end
end
