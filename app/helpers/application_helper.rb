module ApplicationHelper

  def is_signed_in?
    return @current_user.present?
  end

end
