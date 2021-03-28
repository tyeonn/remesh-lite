class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.string :text, null: false
      t.datetime :sent_date, null: false
      t.timestamps
    end
  end
end
