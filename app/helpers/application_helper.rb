module ApplicationHelper
  def render_navbar
    return if current_page?(root_path)

    render 'layouts/navbar'
  end
end
