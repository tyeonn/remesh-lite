class CreateThoughts < ActiveRecord::Migration[6.1]
  def change
    create_table :thoughts do |t|
      t.string :text, null: false
      t.datetime :sent_date, null: false

      t.timestamps
    end
  end
end
