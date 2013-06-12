class Incident
  include Mongoid::Document
  include Mongoid::Versioning
  include Mongoid::Sequence
  field :dt, type: Time
  field :incident, type: Integer
  field :type, type: String
  field :unit, type: String
  field :comment, type: String
  field :location, type: String
  field :status, type: String
  field :group, type: String
 

  belongs_to  :department

  attr_accessible :dt, :incident, :type, :unit, :comment, :location, :status, :group
end
