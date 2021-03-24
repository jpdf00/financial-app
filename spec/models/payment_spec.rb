require 'rails_helper'

RSpec.describe Payment, type: :model do
  describe 'Associations' do
    it { should belong_to(:author) }
    it { should have_and_belong_to_many(:groups) }
  end

  describe 'Name Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(4).is_at_most(32) }
  end

  describe 'Amount Validations' do
    it { should validate_numericality_of(:amount) }
  end
end
