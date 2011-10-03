# encoding: UTF-8

class TareasController < ApplicationController
  before_filter :require_responsable
  
  proc { |controller| controller.request.xhr? ? false : 'application' }
  
  def index
    @tareas = Tarea.order('fecha').paginate(:page => params[:page], :per_page => 15)
    @tareas = @tareas.where(:autor => params[:autor]) if params[:autor]
    @tareas = @tareas.where(:responsable_id => params[:responsable_id]) if params[:responsable_id]
	
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tareas }
    end
  end
  
  # GET /tareas/1/completar
  # GET /tareas/1/completar.xml
  def completa
    @tarea = Tarea.find(params[:id])
    @tarea.update_attribute :completa, true
    
    
     if request.xhr?
      render :partial => 'tarea', :locals => {:tarea => @tarea}
    else
      respond_to do |format|
        format.html { redirect_to(tareas_url) }
        format.xml  { head :ok }
      end
     end
  end
  
  def show
    @tarea = Tarea.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tarea }
    end
  end

  def new
    @tarea = Tarea.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tarea }
    end
  end

  def edit
    @tarea = Tarea.find(params[:id])
  end

  def create
    @tarea = Tarea.new(params[:tarea])

    respond_to do |format|
      if @tarea.save
        format.html { redirect_to(@tarea, :notice => 'Tarea creada ^^') }
        format.xml  { render :xml => @tarea, :status => :created, :location => @tarea }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tarea.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @tarea = Tarea.find(params[:id])

    respond_to do |format|
      if @tarea.update_attributes(params[:tarea])
        format.html { redirect_to(@tarea, :notice => 'Tarea actualizada') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tarea.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @tarea = Tarea.find(params[:id])
    @tarea.destroy

    respond_to do |format|
      format.html { redirect_to(tareas_url) }
      format.xml  { head :ok }
    end
  end
end
