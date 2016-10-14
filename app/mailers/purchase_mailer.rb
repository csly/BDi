class PurchaseMailer < ApplicationMailer
  def purchase_complete_email(purchase)
    @purchase = purchase
    mail(to: @purchase.buyers_email, subject: 'Thank you for your purchase')
  end

  def admin_purchase_complete_email(purchase)
    @purchase = purchase
    mail(to: 'csly-platz@bucksmusicgroup.co.uk', subject: 'Order via the BDi Music Website')
  end
end
