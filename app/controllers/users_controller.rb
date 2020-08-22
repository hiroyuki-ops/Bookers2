class UsersController < ApplicationController
	before_action :authenticate_user!

  def new
  	@user = User.new
  end

  def index
  	@user = current_user
  	@users = User.all
  	@book = Book.new
  end

  def show
  	@user = User.find(params[:id])
  	@books = @user.books
  	@book = Book.new
  end

  def edit
    if params[:id] == current_user.id.to_s
      @user = User.find(params[:id])
      
    else
      redirect_to user_path(@current_user)
    end
  end

  def update
   	@user = User.find(params[:id])
   	if @user.update(user_params)
   	   flash[:notice] = "You have updated user successfully."
   	   redirect_to user_path(@user.id)
    else
       render "edit"
    end
  end

  def create
  	user = User.new(user_params)
  	user.save
  	redirect_to user_path(@current_user)
  end

  private
  def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
