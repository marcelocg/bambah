class PlanilhaController < ApplicationController
  respond_to :json

  def index
    meses = params[:meses] || [Time.now.month]
    anos = params[:anos] || [Time.now.year]

    meses.sort!
    anos.sort!
    @planilha = []
    linha_titulo = ["Naturezas"]
    naturezas = Natureza.all
    anos.each do |ano|
      meses.each do |mes|
        linha_titulo << "#{mes}/#{ano}"
      end
    end

    naturezas.each do |natureza|
      linha = []
      linha << natureza.nome
      anos.each do |ano|
        meses.each do |mes|
          orcamentos  = Orcamento.where(:natureza_id => natureza, :mes => mes, :ano => ano).sum("valor")
          lancamentos = Lancamento.where(:natureza_id => natureza, :mes => mes, :ano => ano).sum("valor")
          linha << [orcamentos, lancamentos]
        end
      end
      @planilha << linha
    end

    @planilha.insert(0, linha_titulo)
    
    respond_with @planilha

  end

  def lancamentos
    meses = params[:meses] || [Time.now.month]
    anos = params[:anos] || [Time.now.year]

    @naturezas = Natureza.uniq.joins("LEFT OUTER JOIN lancamentos ON naturezas.id = lancamentos.natureza_id AND lancamentos.mes IN (#{meses.join(',')}) AND lancamentos.ano IN (#{anos.join(',')})")

    respond_with @naturezas
  end

  def orcamentos
    meses = params[:meses] || [Time.now.month]
    anos = params[:anos] || [Time.now.year]

    @naturezas = Natureza.uniq.joins("LEFT OUTER JOIN orcamentos ON naturezas.id = orcamentos.natureza_id AND orcamentos.mes IN (#{meses.join(',')}) AND orcamentos.ano IN (#{anos.join(',')})")

    respond_with @naturezas
  end

end
