# frozen_string_literal: true

class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver
      redirect_to thanks_path
    else
      # ホームコントローラにエラーメッセージのパラメータを渡す
      redirect_to root_path(messages: @contact.errors.full_messages)
      # render template: 'home/top'
    end
  end

  def thanks
  end

  private

  def contact_params
    params.require(:contact).permit(:email, :message)
  end
end
