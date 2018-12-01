class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :name
      t.text :description
      t.references :user, foreign_key: true
      t.references :list, foreign_key: true
      t.references :category, foreign_key: true
      t.references :city, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
