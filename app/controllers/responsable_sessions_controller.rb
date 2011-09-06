class ResponsableSessionsController < ApplicationController
  before_filter :require_no_responsable, :only => [:new, :create]
  before_filter :require_responsable, :only => :destroy
  
  def new
    @responsable_session = ResponsableSession.new
  end
  
  def create
    @responsable_session = ResponsableSession.new(params[:responsable_session])
    if @responsable_session.save
      flash[:notice] = "Login successful!"
      redirect_back_or_default tareas_path
    else
      render :action => :new
    end
  end
  
  def destroy
    current_responsable_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_back_or_default new_responsable_session_url
  end
end
