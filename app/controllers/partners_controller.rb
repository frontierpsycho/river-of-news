class PartnersController < ApplicationController
  def homepage
  end

  def login
    partner_name = params[:name]
    partner = Partner.find_by_name(partner_name)
    if partner
      redirect_to partner_url(partner)
    else
      redirect_to root_url, notice: 'No partner with that name exists'
    end
  end

  def feed
    @partner = Partner.find(params[:id]) 

    require 'open-uri'

    xml = open(@partner.url).read
    feed = Feed.from_xml(xml)

    # filter and sort
    @items = feed.items.select {|item| ['pressrelease', 'news'].member? item.type_of_media }

    @items.sort {|item1, item2| item1.published_at <=> item2.published_at } 
    
    @partner.last_fetched = Time.now

    unless @partner.save
      head :internal_server_error 
    end
  end

  def fetch_latest
    @partner = Partner.find(params[:id])

    require 'open-uri'

    puts @partner.get_latest
    xml = open(@partner.get_latest).read
    feed = Feed.from_xml(xml)

    # filter and sort
    @items = feed.items.select {|item| ['pressrelease', 'news'].member? item.type_of_media }

    @items.sort {|item1, item2| item1.published_at <=> item2.published_at } 

    @partner.last_fetched = Time.now

    if @partner.save
      render "partners/fetch_latest", layout: false
    else
      head :internal_server_error 
    end
  end

  ### RESTful actions

  # GET /partners
  # GET /partners.json
  def index
    @partners = Partner.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @partners }
    end
  end

  # GET /partners/1
  # GET /partners/1.json
  def show
    @partner = Partner.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @partner }
    end
  end

  # GET /partners/new
  # GET /partners/new.json
  def new
    @partner = Partner.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @partner }
    end
  end

  # GET /partners/1/edit
  def edit
    @partner = Partner.find(params[:id])
  end

  # POST /partners
  # POST /partners.json
  def create
    @partner = Partner.new(params[:partner])

    respond_to do |format|
      if @partner.save
        format.html { redirect_to @partner, notice: 'Partner was successfully created.' }
        format.json { render json: @partner, status: :created, location: @partner }
      else
        format.html { render action: "new" }
        format.json { render json: @partner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /partners/1
  # PUT /partners/1.json
  def update
    @partner = Partner.find(params[:id])

    respond_to do |format|
      if @partner.update_attributes(params[:partner])
        format.html { redirect_to @partner, notice: 'Partner was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @partner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /partners/1
  # DELETE /partners/1.json
  def destroy
    @partner = Partner.find(params[:id])
    @partner.destroy

    respond_to do |format|
      format.html { redirect_to partners_url }
      format.json { head :no_content }
    end
  end
end
