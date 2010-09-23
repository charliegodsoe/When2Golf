module ApplicationHelper
  def title
    base_title = "When 2 Golf"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
end
