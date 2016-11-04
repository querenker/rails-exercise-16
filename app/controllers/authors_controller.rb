class AuthorsController < ApplicationController
  def new
  end

  def create
    redirect_to new_author_path
  end

end
