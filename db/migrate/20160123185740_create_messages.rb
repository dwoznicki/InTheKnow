class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
    	t.string :body
    	t.date :start_date
    	t.date :end_date
    	t.references :organization
    	t.references :tag

      t.timestamps null: false
    end
  end
end
