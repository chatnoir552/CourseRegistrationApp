class UsersController < ApplicationController
  skip_before_action :login_required, only:[:new, :create]
  before_action :no_authority_after_login, only:[:new, :create]

  def new
    @user = User.new
  end


  def new2
    @maincredit = current_user.maincredits.new
  end

  def create
    @user = User.new(user_params)
    @user.admin = false

    if @user.save
      session[:user_id] = @user.id
      redirect_to users2_path, notice: "ユーザー『#{@user.name}を登録しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  
  def setting
    @user = User.find_by(id: session[:user_id])


  end

  def update
    @user = User.find_by(id: session[:user_id])
    if @user.update(user_update_params)
       redirect_to setting_path, notice: "プロフィールの設定を更新しました"
    else
      render :setting, status: :unprocessable_entity
    end
  end

  private

  def user_update_params
    params.require(:user).permit(:grade, :semester, :name)
  end

  def user_params
    params.require(:user).permit(:grade, :semester, :name, :password)
  end

  def maincredit_params
    params.require(:maincredit).permit(:subject, :credit)
  end

end
