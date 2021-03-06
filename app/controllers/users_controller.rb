class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_current_user, except: [:show]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
  end

  # GET /users/1/edit
  def edit
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_current_user
    @user = current_user
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:email, :name)
  end
end
