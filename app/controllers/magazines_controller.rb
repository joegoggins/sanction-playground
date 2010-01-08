class MagazinesController < ApplicationController
  # GET /magazines
  # GET /magazines.xml
  def index
    @magazines = Magazine.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @magazines }
    end
  end

  # GET /magazines/1
  # GET /magazines/1.xml
  def show
    @magazine = Magazine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @magazine }
    end
  end

  # GET /magazines/new
  # GET /magazines/new.xml
  def new
    @magazine = Magazine.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @magazine }
    end
  end

  # GET /magazines/1/edit
  def edit
    @magazine = Magazine.find(params[:id])
  end

  # POST /magazines
  # POST /magazines.xml
  def create
    @magazine = Magazine.new(params[:magazine])

    respond_to do |format|
      if @magazine.save
        flash[:notice] = 'Magazine was successfully created.'
        format.html { redirect_to(@magazine) }
        format.xml  { render :xml => @magazine, :status => :created, :location => @magazine }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @magazine.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /magazines/1
  # PUT /magazines/1.xml
  def update
    @magazine = Magazine.find(params[:id])

    respond_to do |format|
      if @magazine.update_attributes(params[:magazine])
        flash[:notice] = 'Magazine was successfully updated.'
        format.html { redirect_to(@magazine) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @magazine.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /magazines/1
  # DELETE /magazines/1.xml
  def destroy
    @magazine = Magazine.find(params[:id])
    @magazine.destroy

    respond_to do |format|
      format.html { redirect_to(magazines_url) }
      format.xml  { head :ok }
    end
  end
end
