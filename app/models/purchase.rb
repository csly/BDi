class Purchase < ActiveRecord::Base
  belongs_to :shop_item
  def self.paypal_url(item, purchase, return_path)
    values = {
        business: ENV["PAYPAL_EMAIL"],
        cmd: "_xclick",
        currency_code: "GBP",
        upload: 1,
        return: "#{ENV["APP_HOST"]}#{return_path}",
        invoice: purchase.id,
        amount: item.price,
        item_name: item.name,
        item_number: item.id,
        quantity: '1',
        notify_url: "#{Rails.application.secrets.app_host}/purchase_complete"
    }
    "#{ENV["PAYPAL_HOST"]}/cgi-bin/webscr?" + values.to_query
  end

  def update_from_params(params)
    params = ActiveSupport::HashWithIndifferentAccess.new(params)
    self.status = params[:payment_status]
    self.purchased_at = params[:payment_date]
    self.total_amount = params[:mc_gross]
    self.buyers_name = [params[:first_name], params[:last_name]].join(' ')
    self.buyers_email = params[:payer_email]
    self.address_name = params[:address_name]
    self.address_street = params[:address_street]
    self.address_city = params[:address_city]
    self.address_state = params[:address_state]
    self.address_zip = params[:address_zip]
    self.address_country = params[:address_country]
    
    self.save!
  end
end