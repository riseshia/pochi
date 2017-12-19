# frozen_string_literal: true

class SessionController < ApplicationController
  skip_before_action :require_sign_in, only: %i[new failure create]

  def new; end

  def failure; end

  def create
    auth = request.env["omniauth.auth"]
    user = User.sign_in!(auth)
    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to sign_in_path
  end
end
