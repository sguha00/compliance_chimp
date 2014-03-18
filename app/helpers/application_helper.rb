module ApplicationHelper
  def markdown(field)
    raw redcarpet_html_renderer.render(field) unless field.blank?
  end

  def redcarpet_html_renderer
    Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, space_after_headers: true)
  end
end
