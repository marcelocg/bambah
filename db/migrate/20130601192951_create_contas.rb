class CreateContas < ActiveRecord::Migration
  def change
    create_table :contas do |t|
      t.string :nome
      t.string :descricao
      t.boolean :cartao

      t.timestamps
    end
  end
end
