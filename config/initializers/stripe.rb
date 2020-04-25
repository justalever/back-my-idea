Rails.configuration.stripe = {
  :publishable_key => Rails.application.credentials.dig(:stripe, :public_key),
  :secret_key => Rails.application.credentials.dig(:stripe, :private_key)
}
Stripe.api_key = Rails.application.credentials.dig(:stripe, :private_key)
