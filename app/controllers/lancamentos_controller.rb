class LancamentosController < ApplicationController
  
  def index
    mes = params[:mes] || [Time.now.month]
    ano = params[:ano] || [Time.now.year]

    @lancamentos = Lancamento.includes(:natureza, :conta).where(:mes => mes, :ano => ano).order("ano, mes")
    @lancamentos = @lancamentos.where(:natureza_id => params[:natureza_id]) if params[:natureza_id]
  end

end
