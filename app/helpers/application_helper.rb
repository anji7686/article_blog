module ApplicationHelper
  # Creates a submit button with the given name with a cancel link
  # Accepts two arguments: Form object and the cancel link name
  def submit_or_cancel(form, name='Cancel')
    form.submit + " or " + link_to(name, 'javascript:history.go(-1);', :class => 'cancel')
  end

  def link_to_render_partial(display_name,path,article_id,options={})
      link_to display_name, render_partial_path({:controller=>"application" ,:action=>'render_partial',:article_id=>article_id}.merge(options))
  end 

end
