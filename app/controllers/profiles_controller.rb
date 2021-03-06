class ProfilesController < ApplicationController

  before_filter :find_user, :only => [:edit, :update]
  before_filter :sign_in_required, :only => [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save(:validate => true)
      flash[:notice] = 'Signed up successfully'
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @user.attributes = params[:user]
    if @user.save(:validate => true)
      flash[:notice] = 'Profile updated successfully.'
      redirect_to edit_user_path
    else
      render :edit
    end
  end

  private

  def find_user
    @user = current_user
  end

end
