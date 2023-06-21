class BookmarksController < ApplicationController
  def new
    @bookmark = current_user.bookmarks.new
  end

  def index
    @bookmarks = current_user.bookmarks.all.order(period: :asc)
  end

  def create
    @bookmark = current_user.bookmarks.new(bookmark_params)
    @bookmark.school_year = @current_user.grade
    @bookmark.take = false

    if @bookmark.necessary == true
       @bookmark.take = true
    end   

    if @bookmark.save
      redirect_to bookmarks_path, notice: "ブックマークを登録しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = current_user.bookmarks.find_by(id: params[:id])

    @bookmark.destroy
    redirect_to bookmarks_path
  end

  def take
    @bookmark = current_user.bookmarks.find_by(id: params[:id])

     if @bookmark.take == true
        @bookmark.take = false
        @bookmark.save
        redirect_to bookmarks_path, flash: {success: "#{@bookmark.name}を時間割から除きました"}
    else 
         @bookmark.take = true
         @bookmark.save
         redirect_to bookmarks_path, flash: {success: "#{@bookmark.name}を時間割に入れました"}
    end

    
    
  end

  private 

  def bookmark_params
    params.require(:bookmark).permit(:name, :day_of_week, :period, :credit, :necessary)
  end

end
