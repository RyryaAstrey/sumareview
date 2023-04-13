class Public::HomesController < ApplicationController
  before_action :search_template, only: [:top] # application_controllerに記述
  
  def top
  end
  
  def about
  end

end
