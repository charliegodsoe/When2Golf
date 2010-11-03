module Admin::TimeDisplayFormatsHelper
  def add_time_format_group_link(name, form)
    link_to_function name do |page|
      logger.debug("In the helper function.")
      form.fields_for  :time_format_groups do |time_format_group_fields|
  		  #time_format_group = escape_javascript(render(:partial => 'time_format_group', :locals => {:f => time_format_group_fields}))
        time_format_group = render(:partial => 'time_format_group', :locals => {:f => time_format_group_fields})
        page.insert_html :bottom, :time_format_groups, time_format_group
        #page << "$('#time_format_groups').append(\"#{time_format_group}\")"
      end
      #time_format_group = escape_javascript(render(:partial => 'time_format_group', :locals => { :f => form, :task => TimeFormatGroup.new }))
      #page << "$('#time_format_groups').append(\"#{time_format_group}\")"
      
      # page.insert_html :bottom, :time_format_groups, :partial => 'time_format_group', :object => TimeFormatGroup.new
      
      #Example:
      # partial = escape_javascript(render :partial => "my_partial", :object => Object.new)
      # page <<  "$('#my_div').append(\"#{partial}\")"
    end
  end
  
end
