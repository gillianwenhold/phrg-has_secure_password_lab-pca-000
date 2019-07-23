# frozen_string_literal: true

class UsersController < ApplicationController
  def new; end

  def create
    @user = User.new(user_params)
    return redirect_to signup_path unless @user.save
    session[:user_id] = @user.id
    redirect_to home_path
  end

  def show; end

private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
