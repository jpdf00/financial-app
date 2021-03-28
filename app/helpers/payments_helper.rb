module PaymentsHelper
  def group_btns(groups, payment)
    out = ''
    groups.each do |group|
      out += if payment.groups.include?(group)
               render 'remove_group', group: group, grouped_payment: payment.grouped_payment_find(group)
             else
               render 'add_group', group: group
             end
    end
    out.html_safe
  end

  def show_icon(payment)
    return if payment.groups.empty?

    tag.div class: 'align-self-start' do
      tag.img src: payment.groups.first.icon, class: 'square-big'
    end
  end
end
