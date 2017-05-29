class Admin::UsersController < Admin::ApplicationController
  def index
    @users = User.customers.page(params[:page]).per(10)
    @users = @users.where("username like ?", "%#{params[:name]}%")
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @user.build_user_profile
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, :notice => "Successfully created user."
    else
      render :action => 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to admin_users_path, :notice  => "Successfully updated user."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_url, :notice => "Successfully destroyed user."
  end


  def export_users

    @users = User.all

    respond_to do |format|
      format.xlsx {response.headers['Content-Disposition'] = 'attachment; filename="' + Date.today.strftime("%F") + '_User_Data.xlsx"' }
    end

  end

  private
  def user_params
    params.require(:user).permit(:username, :phone, :email, :email1, :user_status, :user_level, :wash_offer, :wash_offer_memo, :password, :password_confirmation,\
                                 user_profile_attributes: [:gender, :birth_date, :come_from, :is_married, :memo, :have_kakao, :kakao_id, :image])
  end
end
