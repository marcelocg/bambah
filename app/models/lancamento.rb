class Lancamento < ActiveRecord::Base
  belongs_to :natureza
  belongs_to :conta
  attr_accessible :ano, :descricao, :mes, :realizado, :valor, :natureza, :conta
end
