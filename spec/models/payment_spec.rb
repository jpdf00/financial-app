require 'rails_helper'

RSpec.describe Payment, type: :model do
  describe 'Associations' do
    it { should belong_to(:author) }
    it { should have_and_belong_to_many(:groups) }
  end
end
