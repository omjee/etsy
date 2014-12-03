Rails.configuration.stripe = {
  :publishable_key => ENV['pk_test_CIusCN4xa0Yjwav5AzXMyUz0'],
  :secret_key      => ENV['sk_test_J9RHF2LaEoqjvjaR4BuOaUY3']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]