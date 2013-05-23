class Department
  include Mongoid::Document
  include Mongoid::Sequence

  field :name, type: String
  field :location, type: String 
  field :id, type: Integer
  has_many :incidents

  sequence :id
  attr_accessible :name, :location
end
