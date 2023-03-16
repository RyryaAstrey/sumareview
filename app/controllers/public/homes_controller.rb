class Public::HomesController < ApplicationController
  before_action :search_template, only: [:top]
  
  def top
  end

end
