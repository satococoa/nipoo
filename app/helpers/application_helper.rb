module ApplicationHelper
  def markdown(text)
    options = {
      :autolink => true,
      :hard_wrap => true
    }
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(options))
    @markdown.render(text).html_safe
  end
end
