class FullBannersController < ApplicationController
  # GET /full_banners
  # GET /full_banners.xml
  def index
    @full_banners = FullBanner.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @full_banners }
    end
  end

  # GET /full_banners/1
  # GET /full_banners/1.xml
  def show
    @full_banner = FullBanner.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @full_banner }
    end
  end

  # GET /full_banners/new
  # GET /full_banners/new.xml
  def new
    @full_banner = FullBanner.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @full_banner }
    end
  end

  # GET /full_banners/1/edit
  def edit
    @full_banner = FullBanner.find(params[:id])
  end

  # POST /full_banners
  # POST /full_banners.xml
  def create
    @full_banner = FullBanner.new(params[:full_banner])

    respond_to do |format|
      if @full_banner.save
        flash[:notice] = 'FullBanner was successfully created.'
        format.html { redirect_to(@full_banner) }
        format.xml  { render :xml => @full_banner, :status => :created, :location => @full_banner }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @full_banner.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /full_banners/1
  # PUT /full_banners/1.xml
  def update
    @full_banner = FullBanner.find(params[:id])

    respond_to do |format|
      if @full_banner.update_attributes(params[:full_banner])
        flash[:notice] = 'FullBanner was successfully updated.'
        format.html { redirect_to(@full_banner) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @full_banner.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /full_banners/1
  # DELETE /full_banners/1.xml
  def destroy
    @full_banner = FullBanner.find(params[:id])
    @full_banner.destroy

    respond_to do |format|
      format.html { redirect_to(full_banners_url) }
      format.xml  { head :ok }
    end
  end
end
