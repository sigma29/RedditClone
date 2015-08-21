module ApplicationHelper
  include ERB::Util

  def form_auth_token
    <<-HTML.html_safe
      <input type="hidden"
        name="authenticity_token"
        value="#{form_authenticity_token}">
    HTML
  end
end
