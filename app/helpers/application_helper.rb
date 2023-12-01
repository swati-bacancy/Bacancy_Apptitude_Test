module ApplicationHelper
	include Pagy::Frontend

  def student_new_page?
    params[:controller] == 'students' && params[:action] == 'new'
  end
end
