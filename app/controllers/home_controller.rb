# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @pagy, @stats = pagy(players)
    render HomeComponent.new(stats: @stats, pagy: @pagy)
  end

  private

  def sort_params
    params.permit(:sort)
  end

  def players
    sort_column = sort_params[:sort].to_s.strip

    if PlayerStat.sorted_cols.include?(sort_column)
      PlayerStat.order(Arel.sql("(stat->>'#{sort_column}')::float").desc)
    else
      PlayerStat.all
    end
  end
end
