class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :update]
  def show # 追加
   @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Microspots!"
      redirect_to @user # ここを修正
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :age, :area, :email, :password,
                                 :password_confirmation)
  end
  
  def edit
  end
  
  def update
    @user = User.(user_params)
    if @user.update(user_params)
      # 保存に成功した場合はトップページへリダイレクト
      redirect_to root_path , notice: 'プロフィールを編集しました'
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end
  private
  def set_user
    @user = User.find(params[:id])
  end
end