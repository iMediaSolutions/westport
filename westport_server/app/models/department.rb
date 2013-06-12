class Department
  include Mongoid::Document
  include Mongoid::Sequence

  field :name, type: String
  field :location, type: String 
  field :dep_id, type: Integer
  has_many :incidents

  attr_accessible :name, :location, :dep_id
end
