# frozen_string_literal: true

class HomeController < ApplicationController
  def top
  	@contact = Contact.new
  end

end
