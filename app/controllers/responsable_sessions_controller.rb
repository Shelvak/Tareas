class ResponsableSessionsController < ApplicationController
  before_filter :require_no_responsable, :only => [:new, :create]
  before_filter :require_responsable, :only => :destroy
  
  def new
    @responsable_session = ResponsableSession.new
  end
  
  def create
    @responsable_session = ResponsableSession.new(params[:user_session])
    if @responsable_session.save
      flash[:notice] = "Login successful!"
      redirect_back_or_default account_url
    else
      render :action => :new
    end
  end
  
  def destroy
    current_responsable_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_back_or_default new_user_session_url
  end
end
