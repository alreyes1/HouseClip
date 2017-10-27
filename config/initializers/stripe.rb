Rails.configuration.stripe = {
  :publishable_key => 'pk_test_Nru3f8wKWnt6wlgh0cEMWT5s',
  :secret_key => 'sk_test_ppJC9d9xL21SCX3YYoHtpUI1'
}
Stripe.api_key = Rails.configuration.stripe[:secret_key]
