# frozen_string_literal: true

class UsersController < ApplicationController
  # before_action :authenticate_user!
  before_action :auth_check, except: :index
  before_action :search_user, only: %i[show edit update destroy]
  
  def index
    @users = User.all
  end

  def show
    @tests = @user.tests.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    redirect_to users_path if @user.destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def search_user
    @user = User.find(params[:id])
  end
end
