class CreateTagUsers < ActiveRecord::Migration
  def change
    create_table :tag_users do |t|
    	t.references :tag
    	t.references :user

      t.timestamps null: false
    end
  end
end
