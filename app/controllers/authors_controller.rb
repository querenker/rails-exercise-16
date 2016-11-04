class AuthorsController < ApplicationController
  def new
  end

  def create
    redirect_to new_author_path
  end

  def create
    @author = Author.new(author_params)
	@author.save
	redirect_to new_author_path
  end

  def author_params
	params.require(:author).permit(:first_name, :last_name, :homepage)
  end

end
