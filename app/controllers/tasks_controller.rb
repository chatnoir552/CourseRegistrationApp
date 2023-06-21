class TasksController < ApplicationController
  skip_before_action :login_required, only:[:top]
  def top
  end

  def index
    @takes11 = current_user.bookmarks.where(take: true).where(day_of_week: "月曜日", period: 1)
    @takes12 = current_user.bookmarks.where(take: true).where(day_of_week: "月曜日", period: 2)
    @takes13 = current_user.bookmarks.where(take: true).where(day_of_week: "月曜日", period: 3)
    @takes14 = current_user.bookmarks.where(take: true).where(day_of_week: "月曜日", period: 4)
    @takes15 = current_user.bookmarks.where(take: true).where(day_of_week: "月曜日", period: 5)
    @takes16 = current_user.bookmarks.where(take: true).where(day_of_week: "月曜日", period: 6)
    @takes17 = current_user.bookmarks.where(take: true).where(day_of_week: "月曜日", period: 7)

    @takes21 = current_user.bookmarks.where(take: true).where(day_of_week: "火曜日", period: 1)
    @takes22 = current_user.bookmarks.where(take: true).where(day_of_week: "火曜日", period: 2)
    @takes23 = current_user.bookmarks.where(take: true).where(day_of_week: "火曜日", period: 3)
    @takes24 = current_user.bookmarks.where(take: true).where(day_of_week: "火曜日", period: 4)
    @takes25 = current_user.bookmarks.where(take: true).where(day_of_week: "火曜日", period: 5)
    @takes26 = current_user.bookmarks.where(take: true).where(day_of_week: "火曜日", period: 6)
    @takes27 = current_user.bookmarks.where(take: true).where(day_of_week: "火曜日", period: 7)

    @takes31 = current_user.bookmarks.where(take: true).where(day_of_week: "水曜日", period: 1)
    @takes32 = current_user.bookmarks.where(take: true).where(day_of_week: "水曜日", period: 2)
    @takes33 = current_user.bookmarks.where(take: true).where(day_of_week: "水曜日", period: 3)
    @takes34 = current_user.bookmarks.where(take: true).where(day_of_week: "水曜日", period: 4)
    @takes35 = current_user.bookmarks.where(take: true).where(day_of_week: "水曜日", period: 5)
    @takes36 = current_user.bookmarks.where(take: true).where(day_of_week: "水曜日", period: 6)
    @takes37 = current_user.bookmarks.where(take: true).where(day_of_week: "水曜日", period: 7)

    @takes41 = current_user.bookmarks.where(take: true).where(day_of_week: "木曜日", period: 1)
    @takes42 = current_user.bookmarks.where(take: true).where(day_of_week: "木曜日", period: 2)
    @takes43 = current_user.bookmarks.where(take: true).where(day_of_week: "木曜日", period: 3)
    @takes44 = current_user.bookmarks.where(take: true).where(day_of_week: "木曜日", period: 4)
    @takes45 = current_user.bookmarks.where(take: true).where(day_of_week: "木曜日", period: 5)
    @takes46 = current_user.bookmarks.where(take: true).where(day_of_week: "木曜日", period: 6)
    @takes47 = current_user.bookmarks.where(take: true).where(day_of_week: "木曜日", period: 7)

    @takes51 = current_user.bookmarks.where(take: true).where(day_of_week: "金曜日", period: 1)
    @takes52 = current_user.bookmarks.where(take: true).where(day_of_week: "金曜日", period: 2)
    @takes53 = current_user.bookmarks.where(take: true).where(day_of_week: "金曜日", period: 3)
    @takes54 = current_user.bookmarks.where(take: true).where(day_of_week: "金曜日", period: 4)
    @takes55 = current_user.bookmarks.where(take: true).where(day_of_week: "金曜日", period: 5)
    @takes56 = current_user.bookmarks.where(take: true).where(day_of_week: "金曜日", period: 6)
    @takes57 = current_user.bookmarks.where(take: true).where(day_of_week: "金曜日", period: 7)

    @takes61 = current_user.bookmarks.where(take: true).where(day_of_week: "土曜日", period: 1)
    @takes62 = current_user.bookmarks.where(take: true).where(day_of_week: "土曜日", period: 2)
    @takes63 = current_user.bookmarks.where(take: true).where(day_of_week: "土曜日", period: 3)
    @takes64 = current_user.bookmarks.where(take: true).where(day_of_week: "土曜日", period: 4)
    @takes65 = current_user.bookmarks.where(take: true).where(day_of_week: "土曜日", period: 5)
    @takes66 = current_user.bookmarks.where(take: true).where(day_of_week: "土曜日", period: 6)
    @takes67 = current_user.bookmarks.where(take: true).where(day_of_week: "土曜日", period: 7)

    @takes71 = current_user.bookmarks.where(take: true).where(day_of_week: "日曜日", period: 1)
    @takes72 = current_user.bookmarks.where(take: true).where(day_of_week: "日曜日", period: 2)
    @takes73 = current_user.bookmarks.where(take: true).where(day_of_week: "日曜日", period: 3)
    @takes74 = current_user.bookmarks.where(take: true).where(day_of_week: "日曜日", period: 4)
    @takes75 = current_user.bookmarks.where(take: true).where(day_of_week: "日曜日", period: 5)
    @takes76 = current_user.bookmarks.where(take: true).where(day_of_week: "日曜日", period: 6)
    @takes77 = current_user.bookmarks.where(take: true).where(day_of_week: "日曜日", period: 7)


  end
end
