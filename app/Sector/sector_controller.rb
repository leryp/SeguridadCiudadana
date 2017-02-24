require 'rho/rhocontroller'
require 'helpers/browser_helper'

class SectorController < Rho::RhoController
  include BrowserHelper

  # GET /Sector
  def index
    @sectors = Sector.find(:all)
    render :back => '/app'
  end

  # GET /Sector/{1}
  def show
    @sector = Sector.find(@params['id'])
    if @sector
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Sector/new
  def new
    @sector = Sector.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Sector/{1}/edit
  def edit
    @sector = Sector.find(@params['id'])
    if @sector
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Sector/create
  def create
    @sector = Sector.create(@params['sector'])
    redirect :action => :index
  end

  # POST /Sector/{1}/update
  def update
    @sector = Sector.find(@params['id'])
    @sector.update_attributes(@params['sector']) if @sector
    redirect :action => :index
  end

  # POST /Sector/{1}/delete
  def delete
    @sector = Sector.find(@params['id'])
    @sector.destroy if @sector
    redirect :action => :index  
  end
end
