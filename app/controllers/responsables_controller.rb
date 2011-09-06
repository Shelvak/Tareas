class ResponsablesController < ApplicationController
  before_filter :require_responsable, :except => [:new, :create]
 
  def index
    @responsables = Responsable.order('email')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @responsables }
    end
  end

  def show
    @responsable = Responsable.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @responsable }
    end
  end

  def new
    @responsable = Responsable.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @responsable }
    end
  end

  def edit
    @responsable = Responsable.find(params[:id])
  end

  def create
    @responsable = Responsable.new(params[:responsable])

    respond_to do |format|
      if @responsable.save
        format.html { redirect_to(@responsable, :notice => 'Responsable creado =)') }
        format.xml  { render :xml => @responsable, :status => :created, :location => @responsable }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @responsable.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @responsable = Responsable.find(params[:id])

    respond_to do |format|
      if @responsable.update_attributes(params[:responsable])
        format.html { redirect_to(@responsable, :notice => 'Responsable actualizado =D.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @responsable.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @responsable = Responsable.find(params[:id])
    @responsable.destroy

    respond_to do |format|
      format.html { redirect_to(responsables_url) }
      format.xml  { head :ok }
    end
  end
end
