class LancamentosController < ApplicationController

  def index
    @mes = params[:mes] || Time.now.month
    @ano = params[:ano] || Time.now.year

    @lancamentos = Lancamento.includes(:natureza, :conta).where(:mes => @mes, :ano => @ano)
    @lancamentos = @lancamentos.where(:natureza_id => params[:natureza_id]) if params[:natureza_id]
  end

  def create
    @mes = params[:mes] || Time.now.month
    @ano = params[:ano] || Time.now.year

    @lancamento = Lancamento.new
    @lancamento.mes = params[:mes]
    @lancamento.ano = params[:ano]
    @lancamento.natureza_id = params[:natureza_id]
    @lancamento.valor = params[:valor]
    
    @lancamento.save

    @lancamentos = Lancamento.includes(:natureza, :conta).where(:mes => @mes, :ano => @ano)

  end
end
