class OrderMailer < ApplicationMailer
  def complete(args)
    email = args[:email]
    @url  = 'http://localhost:8000/orders'
    mail(to: email, subject: 'Your order has been completed')
  end
end
