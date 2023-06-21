class SessionsController < ApplicationController
  skip_before_action :login_required, only:[:new, :create]
  before_action :no_authority_after_login, only:[:new, :create]

  def new

  end

  def create
    user = User.find_by(name: session_params[:name])

    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to tasks_path, notice: 'ログインしました'
    else
      flash.now[:error] = "ログインに失敗しました"
      render :new, status: :unprocessable_entity
    end  


  end

  def destroy
    reset_session
    redirect_to login_path, notice: "ログアウトしました"
  end

  private

  def session_params
    params.require(:session).permit(:name, :password)
  end

end
