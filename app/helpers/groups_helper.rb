module GroupsHelper
  def show_payments(group)
    out = ''
    group.payments.includes(:author).each do |payment|
      out += render 'payment_list', payment: payment
    end
    out.html_safe
  end
end
