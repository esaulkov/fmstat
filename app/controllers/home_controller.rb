# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    render home_component
  end

  private

  def home_component
    @home_component ||= HomeComponent.new(stats: PlayerStat.all)
  end
end
