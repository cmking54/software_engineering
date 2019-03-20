module ApplicationHelper
  def check_admin
    if user_signed_in?
      current_user.admin
    end
  end
end
