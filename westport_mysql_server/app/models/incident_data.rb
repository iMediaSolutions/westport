class IncidentData < ActiveRecord::Base
  attr_accessible :incident_id, :incident_type_id, :value, :created_at, :updated_at
  belongs_to :incident
  belongs_to :incident_type
end
