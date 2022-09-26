# frozen_string_literal: true

# checkout_controller
class PaymentsController < ApplicationController
  def create # rubocop:disable Metrics/MethodLength
    user = current_user
    product = Stripe::Product.create({ name: user.email })
    price = Stripe::Price.create({
                                   unit_amount: 2000,
                                   currency: 'usd',
                                   product: product.id
                                 })
    @session =
      Stripe::Checkout::Session.create({
                                         payment_method_types: ['card'],
                                         line_items: [{
                                           price: price.id,
                                           quantity: 1
                                         }],
                                         mode: 'payment',
                                         success_url: edit_user_url(user, payment_succeeded: true),
                                         cancel_url: root_url
                                       })
    respond_to { |format| format.js }
  end
end
