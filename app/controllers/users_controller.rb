class UsersController < ApplicationController

  include Pundit

  before_action :authenticate_user!
  after_action  :verify_authorized, :except => :index
  rescue_from   Pundit::NotAuthorizedError, :with => :user_not_authorized
  rescue_from   ActiveRecord::RecordNotFound, :with => :user_not_found

  def index
    @users = policy_scope(User) #=> @users = UserPolicy::Scope.new(current_user, User).resolve
    render :index
  end

  def show
      @user = User.find(params[:id])
      authorize @user
      render :show
  end

  def destroy
      @user = User.find(params[:id])
      authorize @user
      user = current_user
      sign_out(current_user)
      user.delete
  end


  private

  def user_not_authorized
    redirect_to root_path, :flash => {:notice => "Access denied."}
  end

  def user_not_found
    render :plain => " record not found"
  end

end
