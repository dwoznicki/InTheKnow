class CreateTagUsers < ActiveRecord::Migration
  def change
    create_table :tag_users do |t|

      t.timestamps null: false
    end
  end
end
