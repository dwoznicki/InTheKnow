class CreateOrganizationUsers < ActiveRecord::Migration
  def change
    create_table :organization_users do |t|
    	t.references :organization
    	t.references :user

      t.timestamps null: false
    end
  end
end
