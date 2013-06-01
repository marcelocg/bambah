class CreateLancamentos < ActiveRecord::Migration
  def change
    create_table :lancamentos do |t|
      t.integer :mes
      t.integer :ano
      t.string :descricao
      t.decimal :valor
      t.boolean :realizado
      t.references :natureza
      t.references :conta

      t.timestamps
    end
    add_index :lancamentos, :natureza_id
    add_index :lancamentos, :conta_id
  end
end
