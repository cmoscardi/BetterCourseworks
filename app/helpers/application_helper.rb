module ApplicationHelper

  def title
    base_title = "BetterCourseworks"
    
    if @title.nil?
      base_title
    else 
      "#{base_title} | #{@title}"
    end
  end

  def email_address
    "mailto:clm2183@columbia.edu"
  end
end
