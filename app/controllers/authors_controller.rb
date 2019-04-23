class AuthorsController < ApplicationController
  before_action :set_author!, only: [:show, :edit, :update]

  def show
  #  @author = Author.find(params[:id])
    set_author!
  end

  def new
    @author = Author.new
  end

  def create
    #@author = Author.create(author_params)
    @author = Author.new(author_params)
    if @author.valid? 
      @author.save
      redirect_to author_path(@author)
    else
      render :new
    end


  end

  private

  def author_params
    params.permit(:name, :email, :phone_number)
  end

  def set_author!
    @author = Author.find_by(params[:id])
  end
end
