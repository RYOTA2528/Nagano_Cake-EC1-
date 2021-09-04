class Admin::GenresController < ApplicationController
before_action :authenticate_admin!

  def index
    @genre = Genre.new
    @genres = Genre.all
    @genres = Genre.paginate(page: params[:page], per_page: 5)
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save!
    redirect_to admin_genres_path(@genre)
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
     @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
    redirect_to admin_genres_path(@genres)
    flash[:notice]='You have updated book successfully.'
    else
    render :edit
    end
  end

 private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
