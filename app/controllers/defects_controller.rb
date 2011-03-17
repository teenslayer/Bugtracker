class DefectsController < ApplicationController
  layout 'application'
  before_filter :login_required, :except => :index
  # GET /defects
  # GET /defects.xml
  def index
    @defects = Defect.all.paginate :page => params[:page], :per_page => 5
    @defects_open = Defect.open_bug.paginate :page => params[:page], :per_page => 5
    @defects_new = Defect.new_bug.paginate :page => params[:page], :per_page => 5

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @defects }
    end
  end

  # GET /defects/1
  # GET /defects/1.xml
  def show
    @defect = Defect.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @defect }
    end
  end

  # GET /defects/new
  # GET /defects/new.xml
  def new
    @defect = Defect.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @defect }
    end
  end

  # GET /defects/1/edit
  def edit
    @defect = Defect.find(params[:id])
  end

  # POST /defects
  # POST /defects.xml
  def create
    @defect = Defect.new(params[:defect])

    respond_to do |format|
      if @defect.save
        flash[:notice] = 'Defect was successfully created.'
        format.html { redirect_to(@defect) }
        format.xml  { render :xml => @defect, :status => :created, :location => @defect }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @defect.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /defects/1
  # PUT /defects/1.xml
  def update
    @defect = Defect.find(params[:id])

    respond_to do |format|
      if @defect.update_attributes(params[:defect])
        flash[:notice] = 'Defect was successfully updated.'
        format.html { redirect_to(@defect) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @defect.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /defects/1
  # DELETE /defects/1.xml
  def destroy
    @defect = Defect.find(params[:id])
    @defect.destroy

    respond_to do |format|
      format.html { redirect_to(defects_url) }
      format.xml  { head :ok }
    end
  end
end
