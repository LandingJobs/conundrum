module ApplicationHelper

  def m(text)
    require 'redcarpet_pygmentize'
    renderer = PygmentizeHTML.new(hard_wrap:true, filter_html:true)
    extensions = { space_after_headers: true,
                     no_intra_emphasis: true,
                           superscript: true,
                    fenced_code_blocks: true }
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end
end
