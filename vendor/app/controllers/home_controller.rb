class HomeController < ApplicationController
  def welcome
    render :text => "Welcome to biodatomics!", :layout => true
  end
end
