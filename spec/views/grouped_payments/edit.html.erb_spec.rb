require 'rails_helper'

RSpec.describe "grouped_payments/edit", type: :view do
  before(:each) do
    @grouped_payment = assign(:grouped_payment, GroupedPayment.create!())
  end

  it "renders the edit grouped_payment form" do
    render

    assert_select "form[action=?][method=?]", grouped_payment_path(@grouped_payment), "post" do
    end
  end
end
