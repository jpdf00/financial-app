require 'rails_helper'

RSpec.describe "grouped_payments/show", type: :view do
  before(:each) do
    @grouped_payment = assign(:grouped_payment, GroupedPayment.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
