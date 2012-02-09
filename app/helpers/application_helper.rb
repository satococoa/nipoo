# coding: utf-8
module ApplicationHelper
  def markdown(text)
    simple_format(text)
=begin
    begin
      options = {
        :autolink => true,
        :hard_wrap => true
      }
      @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(options))
      @markdown.render(text).html_safe
    rescue => e
      Rails.logger.error [e.class, e.message].join(' ')
      simple_format("変換に失敗しました。。。\n\n"+text)
    end
=end
  end
end
