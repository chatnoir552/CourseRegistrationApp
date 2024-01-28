class SchedulesController < ApplicationController
  def search

  end

  def index
    @follows = current_user.follows.all

  end

  def table
    @follows = current_user.follows.all
    @users = []
    @follows.each do |follow|
      if follow.adjust == true
        user = User.find_by(id: follow.follow_id)
        @users.push(user)  
      end
    end
    @users.push(current_user)
    @bookmarks = []
    @users.each do |user|
      user.bookmarks.each do |bookmark|
        if bookmark.take == true
           @bookmarks.push(bookmark)
        end
      end
    end
    
   @takes11 = []
   @takes12 = []
   @takes13 = []
   @takes14 = []
   @takes15 = []
   @takes16 = []
   @takes17 = []

   @takes21 = []
   @takes22 = []
   @takes23 = []
   @takes24 = []
   @takes25 = []
   @takes26 = []
   @takes27 = []

   @takes31 = []
   @takes32 = []
   @takes33 = []
   @takes34 = []
   @takes35 = []
   @takes36 = []
   @takes37 = []

   @takes41 = []
   @takes42 = []
   @takes43 = []
   @takes44 = []
   @takes45 = []
   @takes46 = []
   @takes47 = []

   @takes51 = []
   @takes52 = []
   @takes53 = []
   @takes54 = []
   @takes55 = []
   @takes56 = []
   @takes57 = []

   @takes61 = []
   @takes62 = []
   @takes63 = []
   @takes64 = []
   @takes65 = []
   @takes66 = []
   @takes67 = []
   
   @takes71 = []
   @takes72 = []
   @takes73 = []
   @takes74 = []
   @takes75 = []
   @takes76 = []
   @takes77 = []

   @bookmarks.each do |bookmark|
    case bookmark.day_of_week
       when "月曜日"
          case bookmark.period 
            when 1
              @takes11.push(bookmark)
            when 2
              @takes12.push(bookmark)
            when 3
              @takes13.push(bookmark)
            when 4
              @takes14.push(bookmark)
            when 5
              @takes15.push(bookmark)
            when 6
              @takes16.push(bookmark)
            when 7
              @takes17.push(bookmark)  
            end
       when "火曜日"
          case bookmark.period
            when 1
              @takes21.push(bookmark)
            when 2
              @takes22.push(bookmark)
            when 3
              @takes23.push(bookmark)
            when 4
              @takes24.push(bookmark)
            when 5
              @takes25.push(bookmark)
            when 6
              @takes26.push(bookmark)
            when 7
              @takes27.push(bookmark)
          end
       when "水曜日"
          case bookmark.period
            when 1
              @takes31.push(bookmark)
            when 2
              @takes32.push(bookmark)
            when 3
              @takes33.push(bookmark)
            when 4
              @takes34.push(bookmark)
            when 5
              @takes35.push(bookmark)
            when 6
              @takes36.push(bookmark)
            when 7
              @takes37.push(bookmark)
          end   
       when "木曜日"
          case bookmark.period
            when 1
              @takes41.push(bookmark)
            when 2
              @takes42.push(bookmark)
            when 3
              @takes43.push(bookmark)
            when 4
              @takes44.push(bookmark)
            when 5
              @takes45.push(bookmark)
            when 6
              @takes46.push(bookmark)
            when 7
              @takes47.push(bookmark)
          end  
      when "金曜日"
        case bookmark.period
          when 1
            @takes51.push(bookmark)
          when 2
            @takes52.push(bookmark)
          when 3
            @takes53.push(bookmark)
          when 4
            @takes54.push(bookmark)
          when 5
            @takes55.push(bookmark)
          when 6
            @takes56.push(bookmark)
          when 7
            @takes57.push(bookmark)
        end 
      when "土曜日"
        case bookmark.period
          when 1
            @takes61.push(bookmark)
          when 2
            @takes62.push(bookmark)
          when 3
            @takes63.push(bookmark)
          when 4
            @takes64.push(bookmark)
          when 5
            @takes65.push(bookmark)
          when 6
            @takes66.push(bookmark)
          when 7
            @takes67.push(bookmark)
        end
      when "日曜日"
        case bookmark.period
          when 1
            @takes71.push(bookmark)
          when 2
            @takes72.push(bookmark)
          when 3
            @takes73.push(bookmark)
          when 4
            @takes74.push(bookmark)
          when 5
            @takes75.push(bookmark)
          when 6
            @takes76.push(bookmark)
          when 7
            @takes77.push(bookmark)
        end                                  
    end        
   end 
  end

  def searching
    @users = User.search(params[:q])
    @follows = current_user.follows.all
    render :search, status: :unprocessable_entity
  end

  def follow
    @follow = current_user.follows.new(follow_id: params[:id]) 
    if @follow.save
       redirect_to schedule_search_path, flash: {success: "#{User.find_by(id: @follow.follow_id).name}をフォローしました"}
    end
  end

  def unfollow
    @follow = current_user.follows.find_by(follow_id: params[:id]) 

    @follow.destroy
    redirect_to schedule_search_path, flash: {success: "#{User.find_by(id: @follow.follow_id).name}のフォローを外しました"}
  end 

  def index_unfollow
    @follow = current_user.follows.find_by(follow_id: params[:id]) 

    @follow.destroy
    redirect_to schedule_index_path, flash: {success: "#{User.find_by(id: @follow.follow_id).name}のフォローを外しました"}
  end
  
  def adjust
    @follow = current_user.follows.find_by(follow_id: params[:id])

    if @follow.adjust == true
       @follow.adjust = false
       @follow.save
       redirect_to schedule_index_path, flash: {success: "#{User.find_by(id: @follow.follow_id).name}さんを時間調整表から除きました"}
    else
       @follow.adjust = true
       @follow.save
       redirect_to schedule_index_path, flash: {success: "#{User.find_by(id: @follow.follow_id).name}さんを時間調整表に入れました"}
    end
    
  end

  

  
end
