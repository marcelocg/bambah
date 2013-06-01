class Orcamento < ActiveRecord::Base
  belongs_to :natureza
  attr_accessible :ano, :mes, :observacao, :valor, :natureza
end
