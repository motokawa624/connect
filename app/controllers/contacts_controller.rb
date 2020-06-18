# frozen_string_literal: true

class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    # params[:contact][:email]
    # params[:email]
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver
      flash[:success] = 'お問い合わせを受け付けました'
      redirect_to root_path
    else
      render :new
    end
  end

  def thanks; end

  private

  def contact_params
    params.require(:contact).permit(:email, :message)
  end
end
