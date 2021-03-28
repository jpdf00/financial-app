module PaymentsHelper
  def group_btns(groups, payment)
    out = ""
    groups.each do |group|
      if payment.groups.include?(group)
        grouped_payment = payment.grouped_payment_find(group)
        out +=  render 'remove_group', group: group , grouped_payment: payment.grouped_payment_find(group)
      else
        out +=  render 'add_group', group: group
      end
    end
    out.html_safe
  end
end
