class UsersController < ApplicationController

def index
  @users = User.all
  @user = current_user
  @book = Book.new
end

def show
  @user = User.find(params[:id])
  @book = Book.new
end

def edit
  @user = User.find(params[:id])
  if @user == current_user
    render "edit"
  else
    redirect_to user_path(current_user)
  end
end

def update

    @user = User.find(params[:id])


    if @user.update(users_params)

      flash[:notice] = "You have updated book successfully."
      redirect_to user_path(current_user)

    else
      render :edit

    end

end

 private

def users_params
    params.require(:user).permit(:name, :profile_image, :introduction)
end

# ここにID入らないの？

end
