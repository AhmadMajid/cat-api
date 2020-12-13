class Collection < ApplicationRecord
  # model association
  has_many :cats, dependent: :destroy

  # validations
  validates_presence_of :title, :created_by
end
