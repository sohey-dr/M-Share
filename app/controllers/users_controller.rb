class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:edit, :show]

  def show
    @user = User.find(params[:id])
    @likes = @user.likes.order(id: :desc).page(params[:page]).per(25)
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  def update
    @user = User.find(params[:id])
   
    if current_user == @user
   
      if @user.update(user_params)
        flash[:success] = 'ユーザー情報を編集しました。'
        render :edit
      else
        flash.now[:danger] = 'ユーザー情報の編集に失敗しました。'
        render :edit
      end   
     
    else
        redirect_to root_url
    end
  end
  
  def followings
    @user = User.find(params[:id])
    @followings = @user.followings.page(params[:page])
  end
  
  def followers
    @user = User.find(params[:id])
    @followers = @user.followers.page(params[:page])
  end
  
  def shares
    @user = User.find(params[:id])
    @shares = @user.shares.order(id: :desc).page(params[:page])
  end
  
  def favorites
    @user = User.find(params[:id])
    @favorites = @user.favos.page(params[:page])
  end

  private
  
  def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile_img, :back_img, :profile )
  end
end
