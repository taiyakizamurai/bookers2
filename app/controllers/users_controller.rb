class UsersController < ApplicationController


def index
  @users = User.all
  @user = current_user
  @book = Book.new
end

def show
  @user = User.find(params[:id])
  @book = Book.new
  @books = @user.books
end

def edit
   @user = User.find(params[:id])
   @c_user = current_user
  if @user == current_user
    render 'edit'
  else
   redirect_to user_path(@c_user.id)
  end

end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id)
    flash[:notice] = "You have updated user successfully."
    else
      render 'edit'
    end

  end


  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end