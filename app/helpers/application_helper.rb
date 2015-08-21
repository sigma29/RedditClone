module ApplicationHelper
  include ERB::Util

  def form_auth_token
    <<-HTML.html_safe
      <input type="hidden"
        name="authenticity_token"
        value="#{form_authenticity_token}">
    HTML
  end


  def comment_shortener(comment)
    content = comment.content
    if content.length > 30
      content = "#{content.slice(0..30)} ..."
    end
    
    content
  end

end
