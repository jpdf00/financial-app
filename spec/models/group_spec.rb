require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'Associations' do
    it { should belong_to(:user) }
    it { should have_many(:payments).through('grouped_payments') }
  end

  describe 'Name Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(4).is_at_most(32) }
  end

  describe 'Icon Validations' do
    it { should validate_presence_of(:icon) }
  end
end
