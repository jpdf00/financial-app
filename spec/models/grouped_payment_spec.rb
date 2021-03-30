require 'rails_helper'

RSpec.describe GroupedPayment, type: :model do
  describe 'Associations' do
    it { should belong_to(:group).optional }
    it { should belong_to(:payment) }
  end
end
