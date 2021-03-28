require 'rails_helper'

RSpec.describe 'grouped_payments/index', type: :view do
  before(:each) do
    assign(:grouped_payments, [
             GroupedPayment.create!,
             GroupedPayment.create!
           ])
  end

  it 'renders a list of grouped_payments' do
    render
  end
end
