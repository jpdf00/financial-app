require 'rails_helper'

RSpec.describe 'grouped_payments/new', type: :view do
  before(:each) do
    assign(:grouped_payment, GroupedPayment.new)
  end

  it 'renders new grouped_payment form' do
    render

    assert_select 'form[action=?][method=?]', grouped_payments_path, 'post' do
    end
  end
end
