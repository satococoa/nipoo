# coding: utf-8
module ApplicationHelper
  def markdown(text)
    simple_format(text)
    # begin
      # options = {
        # :autolink => true,
        # :hard_wrap => true
      # }
      # @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(options))
      # @markdown.render(text).html_safe
    # rescue => e
      # Rails.logger.error [e.class, e.message].join(' ')
      # "変換に失敗しました。。。\n"+text.html_safe
    # end
  end
end
