class Incident < ActiveRecord::Base
  attr_accessible :created_at, :updated_at
  has_many :incident_datas
end
