class Cat < ApplicationRecord
  # model association
  belongs_to :collection

  # validation
  validates_presence_of :name
end
