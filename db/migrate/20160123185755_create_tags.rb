class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
    	t.string :subject
    	t.text :alias_subject

      t.timestamps null: false
    end
  end
end
