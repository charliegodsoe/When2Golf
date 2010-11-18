module CoursesHelper
  def updated_time_eplapsed(course)
    difference = course.last_updated_ago
    minute = 60 # in seconds
    hour = minute * 60 # in seconds
    day = hour * 24 # in seconds

    return "Not Updated" if course.time_entries.empty?
    return "#{difference / day} days ago" if difference / day != 0
    return "#{difference / hour} hours ago" if difference / hour != 0
    return "#{difference / minute} minutes ago" if difference / minute != 0
    return "#{difference} seconds ago" if difference != 0
  end
end
