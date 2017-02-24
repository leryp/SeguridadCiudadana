require 'rho/rhocontroller'
require 'helpers/browser_helper'

class CiudadanoController < Rho::RhoController
  include BrowserHelper

  # GET /Ciudadano
  def index
    @ciudadanos = Ciudadano.find(:all)
    render :back => '/app'
  end

  # GET /Ciudadano/{1}
  def show
    @ciudadano = Ciudadano.find(@params['id'])
    @sectores = Sector.find(:all)
    if @ciudadano
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Ciudadano/new
  def new
    @ciudadano = Ciudadano.new
    @sectores = Sector.find(:all)
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Ciudadano/{1}/edit
  def edit
    @ciudadano = Ciudadano.find(@params['id'])
    @sectores = Sector.find(:all)
    if @ciudadano
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Ciudadano/create
  def create
    @ciudadano = Ciudadano.create(@params['ciudadano'])
    redirect :action => :index
  end

  # POST /Ciudadano/{1}/update
  def update
    @ciudadano = Ciudadano.find(@params['id'])
    @ciudadano.update_attributes(@params['ciudadano']) if @ciudadano
    redirect :action => :index
  end

  # POST /Ciudadano/{1}/delete
  def delete
    @ciudadano = Ciudadano.find(@params['id'])
    @ciudadano.destroy if @ciudadano
    redirect :action => :index  
  end
  
  def filtro_ciudadanos_form
    @sectores = Sector.find(:all)
  end
  
  def filter_ciudadanos_result
    @ciudadanos = Ciudadano.find(:all, :conditions =>{'sector_id' => @params['sector_id']})
  end
end
