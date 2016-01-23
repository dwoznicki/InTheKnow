class CreateOrganizationUsers < ActiveRecord::Migration
  def change
    create_table :organization_users do |t|

      t.timestamps null: false
    end
  end
end
