class CreateGoals < ActiveRecord::Migration[7.0]
  def change
    create_table :goals do |t|
      t.date :start_date,       null: false
      t.date :target_date,      null: false
      t.integer :pages_per_day, null: false
      t.integer :reading_pages, null: false
      t.integer :status,        null: false

      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.timestamps
    end
  end
end
