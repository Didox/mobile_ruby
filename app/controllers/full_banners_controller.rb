class FullBannersController < ApplicationController
  before_filter :login_required, :only => [:index, :show, :new, :edit, :create, :update, :destroy]

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

  def add_pages
    @full_banner = FullBanner.find(params[:id])
    ids = ""
    @pages_add = []
    @full_banner.pages.collect do |p|
      @pages_add << [ p.name, p.id ]
      ids << "#{p.id},"
    end
    ids = ids[0,(ids.length-1)]

    unless ids.blank?
      @pages = Page.find(:all, :conditions => "id not in (#{ids})").collect{ |p| [ p.name, p.id ]}
    else
      @pages = Page.find(:all).collect{ |p| [ p.name, p.id ]}
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @full_banner }
    end
  end

  def save_pages
    @full_banner = FullBanner.find(params[:id])
    if params[:lstIAdd].nil?
      @full_banner.pages = []
      redirect_to :action => "index"
      return
    end

    @full_banner.pages = Page.find(params[:lstIAdd])
    @full_banner.save

    redirect_to :action => "index"
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
