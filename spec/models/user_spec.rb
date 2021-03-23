require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Associations' do
    it { should have_many(:groups) }
    it { should have_many(:authored_payments) }
  end
end
