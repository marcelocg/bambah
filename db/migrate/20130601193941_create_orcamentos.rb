class CreateOrcamentos < ActiveRecord::Migration
  def change
    create_table :orcamentos do |t|
      t.integer :mes
      t.integer :ano
      t.string :observacao
      t.decimal :valor
      t.references :natureza

      t.timestamps
    end
    add_index :orcamentos, :natureza_id
  end
end
