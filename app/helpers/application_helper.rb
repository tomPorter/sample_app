module ApplicationHelper
  ## NOTE: Because this is module included in a class def, the  
  ## instance variable @title is avail to this module.
  
  # Return a title on a per page basis
  def title
    base_title = "Ruby on Rails Tutorial Sample App"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end  
  end
end
