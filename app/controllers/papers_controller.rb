class PapersController < ApplicationController

  def show
    @paper = Paper.find(params[:id])
  end

  def new
    @paper = Paper.new
  end

  def create
    @paper = Paper.new(author_params)
	if @paper.save
	  redirect_to @paper
    else
      render 'new'
    end
  end

  private

  def author_params
	params.require(:paper).permit(:title, :venue, :year)
  end

end
