class NaturezasController < ApplicationController

  def index

    @naturezas = params[:term] ? Natureza.where("nome like ?", "%#{params[:term]}%").order('id') : Natureza.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @naturezas}
    end    
  end

  def show
    @natureza = Natureza.find(params[:id])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @natureza}
    end    

  end

end
