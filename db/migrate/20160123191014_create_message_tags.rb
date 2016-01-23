class CreateMessageTags < ActiveRecord::Migration
  def change
    create_table :message_tags do |t|
    	t.references :message
    	t.references :tag

      t.timestamps null: false
    end
  end
end
