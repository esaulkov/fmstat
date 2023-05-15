# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @pagy, @stats = pagy(PlayerStat.all)
    render HomeComponent.new(stats: @stats, pagy: @pagy)
  end
end
