class LynksController < ApplicationController
  # GET /lynks
  # GET /lynks.json
  def index
    @lynks = Lynk.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @lynks }
    end
  end

  # GET /lynks/1
  # GET /lynks/1.json
  def show
    @lynk = Lynk.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @lynk }
    end
  end

  # GET /lynks/new
  # GET /lynks/new.json
  def new
    @lynk = Lynk.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @lynk }
    end
  end

  # GET /lynks/1/edit
  def edit
    @lynk = Lynk.find(params[:id])
  end

  # POST /lynks
  # POST /lynks.json
  def create
    @lynk = Lynk.new(params[:lynk])

    respond_to do |format|
      if @lynk.save
        format.html { redirect_to @lynk, :notice => 'Lynk was successfully created.' }
        format.json { render :json => @lynk, :status => :created, :location => @lynk }
      else
        format.html { render :action => "new" }
        format.json { render :json => @lynk.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /lynks/1
  # PUT /lynks/1.json
  def update
    @lynk = Lynk.find(params[:id])

    respond_to do |format|
      if @lynk.update_attributes(params[:lynk])
        format.html { redirect_to @lynk, :notice => 'Lynk was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @lynk.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /lynks/1
  # DELETE /lynks/1.json
  def destroy
    @lynk = Lynk.find(params[:id])
    @lynk.destroy

    respond_to do |format|
      format.html { redirect_to lynks_url }
      format.json { head :ok }
    end
  end
end
