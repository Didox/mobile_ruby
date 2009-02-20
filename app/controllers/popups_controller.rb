class PopupsController < ApplicationController
  # GET /popups
  # GET /popups.xml
  def index
    @popups = Popup.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @popups }
    end
  end

  # GET /popups/1
  # GET /popups/1.xml
  def show
    @popup = Popup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @popup }
    end
  end

  # GET /popups/new
  # GET /popups/new.xml
  def new
    @popup = Popup.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @popup }
    end
  end

  # GET /popups/1/edit
  def edit
    @popup = Popup.find(params[:id])
  end

  # POST /popups
  # POST /popups.xml
  def create
    @popup = Popup.new(params[:popup])

    respond_to do |format|
      if @popup.save
        flash[:notice] = 'Popup was successfully created.'
        format.html { redirect_to(@popup) }
        format.xml  { render :xml => @popup, :status => :created, :location => @popup }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @popup.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /popups/1
  # PUT /popups/1.xml
  def update
    @popup = Popup.find(params[:id])

    respond_to do |format|
      if @popup.update_attributes(params[:popup])
        flash[:notice] = 'Popup was successfully updated.'
        format.html { redirect_to(@popup) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @popup.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /popups/1
  # DELETE /popups/1.xml
  def destroy
    @popup = Popup.find(params[:id])
    @popup.destroy

    respond_to do |format|
      format.html { redirect_to(popups_url) }
      format.xml  { head :ok }
    end
  end
end
