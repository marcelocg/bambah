class CreateNaturezas < ActiveRecord::Migration
  def change
    create_table :naturezas do |t|
      t.string :nome
      t.string :descricao
      t.boolean :receita

      t.timestamps
    end
  end
end
