class NaturezasController < ApplicationController

  def index
    @naturezas = Natureza.all
  end

  def show
    @natureza = Natureza.find(params[:id])
  end

end
