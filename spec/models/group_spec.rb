require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'Associations' do
    it { should belong_to(:user) }
    it { should have_and_belong_to_many(:payments) }
  end
end
