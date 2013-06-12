class CreateIncidentData < ActiveRecord::Migration
  def change
    create_table :incident_data do |t|
      t.integer :incident_id
      t.integer :incident_type_id
      t.string :value

      t.timestamps
    end
  end
end
