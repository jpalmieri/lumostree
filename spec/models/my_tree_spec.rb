require 'rails_helper'

RSpec.describe MyTree, type: :model do
  it { should validate_presence_of(:name) }
end
