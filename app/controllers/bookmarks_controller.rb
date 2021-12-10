class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:destroy]
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    # @bookmark = bookmark.new(bookmark_params)
    # if @bookmark.save!
    #   redirect_to bookmark_path(@bookmark)
    # else
    #   render :new
    # end
  end

  def destroy
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmarks_params
    params.require(:bookmarks).permit(:comment, :movie_id, :list_id)
  end
end
