# frozen_string_literal: true

class HomeController < ApplicationController
  def top
  	@contact = Contact.new
  	# コンタクトコントローラから渡ってきたエラ〜メッセージをインスタンス変数に代入
  	@error_messages = params[:messages] if params[:messages]
  end

end
