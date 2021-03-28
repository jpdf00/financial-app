module ApplicationHelper
  def show_navbar
    return if current_page?(root_path)

    render 'layouts/navbar'
  end

  def show_navbar_bottom
    return if current_page?(new_user_session_path) || current_page?(new_user_registration_path) || current_page?(edit_user_registration_path)

    render 'layouts/navbar_bottom'
  end

  def show_navbar_top
    return render('layouts/navbar_login') if current_page?(new_user_session_path)
    return render('layouts/navbar_signup') if current_page?(new_user_registration_path)
    return render('layouts/navbar_edit') if current_page?(edit_user_registration_path)

    render 'layouts/navbar_main'
  end

  def show_form_errors(box_var)
    out = ''
    if box_var.errors.any?
      out += "<div class=\"m-2 p-2 bg-danger text-white\" id=\"error_explanation\"><h2 class=\"fs-5\">#{pluralize(box_var.errors.count,
                                                            'error')} prohibited this event from being saved:</h2><ul>"
      box_var.errors.full_messages.each do |message|
        out += "<li>#{message}</li>"
      end
      out += '</ul></div>'
    end
    out.html_safe
  end
end
