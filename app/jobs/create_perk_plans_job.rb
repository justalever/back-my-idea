class CreatePerkPlansJob < ApplicationJob
  queue_as :default

  def perform(project)
    key = project.user.access_code
    Stripe.api_key = key

    project.perks.each do |perk|
      Stripe::Plan.create({
        id: "#{perk.title.parameterize}-perk_#{perk.id}",
        amount: (perk.amount.to_r * 100).to_i,
        currency: 'usd',
        interval: 'month',
        product: { name: perk.title },
        nickname: perk.title.parameterize
      })
    end
  end
end
