module ApplicationHelper
  
  def title(page_title)
    content_for(:title) { page_title }
  end
  
  def alert(message=nil)
    if message
      
    end
  end
  
end
