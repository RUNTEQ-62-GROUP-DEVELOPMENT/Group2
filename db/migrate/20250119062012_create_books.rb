class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title,    null: false
      t.string :author,   null: false
      t.integer :pages,   null: false, default: 0
      t.integer :status,  null: false, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
