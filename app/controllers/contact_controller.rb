class ContactController < ApplicationController
  def index
    @contact = Contact.new
  end

  def deliver
    Contact.new(params['contact']).deliver
    redirect_to contact_index_path, notice: 'Thank you for submitting your demo'
  end

  private

  def contact_params
    require('contact').permit(:email, :name, :message)
  end
end
