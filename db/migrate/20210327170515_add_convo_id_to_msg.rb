class AddConvoIdToMsg < ActiveRecord::Migration[6.1]
  def change
    add_column :messages, :conversation_id, :integer, null: false
    add_column :thoughts, :message_id, :integer, null: false
  end
end
