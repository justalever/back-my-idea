module ProjectsHelper
  def purchased_perk(perk)
    user_signed_in? && current_user.perk_subscriptions.include?("#{perk.title.parameterize}-perk_#{perk.id}")
  end
end
