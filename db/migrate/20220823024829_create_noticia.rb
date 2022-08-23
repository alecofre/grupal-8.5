class CreateNoticia < ActiveRecord::Migration[7.0]
  def change
    create_table :noticia do |t|
      t.string :encabezado
      t.text :cuerpo
      t.integer :tipo

      t.timestamps
    end
  end
end
