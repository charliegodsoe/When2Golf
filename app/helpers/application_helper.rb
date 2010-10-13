module ApplicationHelper
  def title
    base_title = "When 2 Golf"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def start_from_group_and_date(time_format_group, date)
    start_time = DateTime.new(date.year, date.month, date.day, time_format_group.start_time.hour, time_format_group.start_time.min)
  end
  
  def end_from_group_and_date(time_format_group, date)
    if(time_format_group.end_time.hour < time_format_group.start_time.hour)    
      end_time = DateTime.new(date.year, date.month, date.day + 1, time_format_group.end_time.hour, time_format_group.end_time.min)
    else  
      end_time = DateTime.new(date.year, date.month, date.day, time_format_group.end_time.hour, time_format_group.end_time.min)
    end
  end
end
