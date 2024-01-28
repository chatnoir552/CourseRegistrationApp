class GetcreditsController < ApplicationController
  def new
    @maincredits = current_user.maincredits.all
    @user = current_user

  end

  def update
   @user = User.find_by(id: session[:user_id])
    if @user.update(user_params)
      redirect_to setting_path
    else
      render :new, status: :unprocessable_entity
    end  
  end

  private

  def user_params
    params.require(:user).permit(maincredits_attributes: [:id, :getcredit, subcredits_attributes: [:id, :getcredit]])
  end
end
