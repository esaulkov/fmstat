# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    render(HomeComponent.new)
  end
end
