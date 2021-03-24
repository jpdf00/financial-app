require 'rails_helper'

RSpec.describe Payment, type: :model do
  describe 'Associations' do
    it { should belong_to(:author).class_name('User') }
    it { should have_many(:groups).through(:grouped_payments) }
  end

  describe 'Name Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(4).is_at_most(32) }
  end

  describe 'Amount Validations' do
    it { should validate_numericality_of(:amount) }
  end
end
