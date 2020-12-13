require 'rails_helper'

RSpec.describe Collection, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

# Test suite for the Collection model
RSpec.describe Collection, type: :model do
  # Association test
  # ensure Collection model has a 1:m relationship with the Cat model
  it { should have_many(:cats).dependent(:destroy) }
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:created_by) }
end
