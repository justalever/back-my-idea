module ApplicationHelper
  def author_of(resource)
    user_signed_in? && resource.user_id == current_user.id
  end
end
