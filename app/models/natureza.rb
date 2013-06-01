class Natureza < ActiveRecord::Base
  has_many :lancamentos
  has_many :orcamentos
  attr_accessible :descricao, :nome, :receita
end
