class PagesController < ApplicationController
  before_filter :login_required, :only => [:index, :show, :new, :edit, :create, :update, :destroy]
  
  def index
    @pages = Page.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pages }
    end
  end

  # GET /pages/1
  # GET /pages/1.xml
  def show
    @page = Page.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @page }
    end
  end

  def add_groups
    @page = Page.find(params[:id])
    ids = ""
    @groups_add = []
    @page.groups.collect do |p|
      @groups_add << [ p.name, p.id ]
      ids << "#{p.id},"
    end
    ids = ids[0,(ids.length-1)]

    unless ids.blank?
      @groups = Group.find(:all, :conditions => "id not in (#{ids})").collect{ |p| [ p.name, p.id ]}
    else
      @groups = Group.find(:all).collect{ |p| [ p.name, p.id ]}
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @page }
    end
  end

  def save_groups
    @page = Page.find(params[:id])
    if params[:lstIAdd].nil?
      @page.groups = []
      redirect_to :action => "index"
      return
    end

    @page.groups = Group.find(params[:lstIAdd])
    @page.save

    redirect_to :action => "index"
  end

  def add_popups
    @page = Page.find(params[:id])
    ids = ""
    @popups_add = []
    @page.popups.collect do |p|
      @popups_add << [ p.name, p.id ]
      ids << "#{p.id},"
    end
    ids = ids[0,(ids.length-1)]

    unless ids.blank?
      @popups = Popup.find(:all, :conditions => "id not in (#{ids})").collect{ |p| [ p.name, p.id ]}
    else
      @popups = Popup.find(:all).collect{ |p| [ p.name, p.id ]}
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @page }
    end
  end
  
  def save_popups
    @page = Page.find(params[:id])
    if params[:lstIAdd].nil?
      @page.popups = []
      redirect_to :action => "index"
      return
    end

    @page.popups = Popup.find(params[:lstIAdd])
    @page.save

    redirect_to :action => "index"
  end

  def add_full_banners
    @page = Page.find(params[:id])
    ids = ""
    @full_banners_add = []
    @page.full_banners.collect do |p|
      @full_banners_add << [ p.name, p.id ]
      ids << "#{p.id},"
    end
    ids = ids[0,(ids.length-1)]

    unless ids.blank?
      @full_banners = FullBanner.find(:all, :conditions => "id not in (#{ids})").collect{ |p| [ p.name, p.id ]}
    else
      @full_banners = FullBanner.find(:all).collect{ |p| [ p.name, p.id ]}
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @page }
    end
  end

  def save_full_banners
    @page = Page.find(params[:id])
    if params[:lstIAdd].nil?
      @page.full_banners = []
      redirect_to :action => "index"
      return
    end

    @page.full_banners = FullBanner.find(params[:lstIAdd])
    @page.save

    redirect_to :action => "index"
  end


  def bind_selects
    @pages = [[:root, 0]]
    #@pages << Page.find(:all).collect {|p| [ p.name, p.id ]}
    Page.find(:all).collect do |p|
      @pages << [ p.name, p.id ]
    end
    len = @pages.length
    len -= 1
    @positions = 0..len
  end
  # GET /pages/new
  # GET /pages/new.xml
  def new
    bind_selects
    @page = Page.new    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @page }
    end
  end

  # GET /pages/1/edit
  def edit
    bind_selects
    @page = Page.find(params[:id])
  end

  # POST /pages
  # POST /pages.xml
  def create
    @page = Page.new(params[:page])

    respond_to do |format|
      if @page.save
        flash[:notice] = 'Page was successfully created.'
        format.html { redirect_to(@page) }
        format.xml  { render :xml => @page, :status => :created, :location => @page }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pages/1
  # PUT /pages/1.xml
  def update
    @page = Page.find(params[:id])

    respond_to do |format|
      if @page.update_attributes(params[:page])
        flash[:notice] = 'Page was successfully updated.'
        format.html { redirect_to(@page) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.xml
  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to(pages_url) }
      format.xml  { head :ok }
    end
  end
end
