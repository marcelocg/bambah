class Conta < ActiveRecord::Base
  has_many :lancamentos
  attr_accessible :cartao, :descricao, :nome
end
