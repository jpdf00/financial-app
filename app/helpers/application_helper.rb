module ApplicationHelper
  def show_navbar
    return if current_page?(root_path)

    render 'layouts/navbar'
  end

  def show_navbar_bottom
    if current_page?(new_user_session_path) ||
       current_page?(new_user_registration_path) ||
       current_page?(edit_user_registration_path)
      return
    end

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
      out += '<div class=\"m-2 p-2 bg-danger text-white\" id=\"error_explanation\">'
      out += "<h2 class=\"fs-5\">#{pluralize(box_var.errors.count,
                                             'error')} prohibited this event from being saved:</h2><ul>"
      box_var.errors.full_messages.each do |message|
        out += "<li>#{message}</li>"
      end
      out += '</ul></div>'
    end
    out.html_safe
  end

  def email_changed(resource)
    if resource.try(:unconfirmed_email?)
      tag.p "We're contacting you to notify you that your email is being changed to #{@resource.unconfirmed_email}."
    else
      tag.p "We're contacting you to notify you that your email has been changed to #{@resource.email}."
    end
  end

  def shared_links
    out = ''

    out += login_link

    out += signup_link

    out += recover_link

    out += confirm_link

    out += unlock_link

    if devise_mapping.omniauthable?
      resource_class.omniauth_providers.each do |provider|
        out += link_to "Sign in with #{OmniAuth::Utils.camelize(provider)}",
                       omniauth_authorize_path(resource_name, provider)
        out += tag.br
      end
    end
    out.html_safe
  end

  def login_link
    out = ''
    if controller_name != 'sessions'
      out += link_to 'Log in', new_session_path(resource_name), class: 'text-black-50 text-decoration-none mb-2'
      out += tag.br
    end
    out.html_safe
  end

  def signup_link
    out = ''
    if devise_mapping.registerable? && controller_name != 'registrations'
      out += link_to 'Create New Account', new_registration_path(resource_name),
                     class: 'text-black-50 text-decoration-none mb-2'
      out += tag.br
    end
    out.html_safe
  end

  def recover_link
    out = ''
    if devise_mapping.recoverable? && controller_name != 'passwords' && controller_name != 'registrations'
      out += link_to 'Forgot your password?', new_password_path(resource_name),
                     class: 'text-black-50 text-decoration-none mb-2'
      out += tag.br
    end
    out.html_safe
  end

  def confirm_link
    out = ''
    if devise_mapping.confirmable? && controller_name != 'confirmations'
      out += link_to "Didn't receive confirmation instructions?", new_confirmation_path(resource_name),
                     class: 'text-black-50 text-decoration-none mb-2'
      out += tag.br
    end
    out.html_safe
  end

  def unlock_link
    out = ''
    if devise_mapping.lockable? && resource_class.unlock_strategy_enabled?(:email) && controller_name != 'unlocks'
      out += link_to "Didn't receive unlock instructions?", new_unlock_path(resource_name),
                     class: 'text-black-50 text-decoration-none mb-2'
      out += tag.br
    end
    out.html_safe
  end
end
