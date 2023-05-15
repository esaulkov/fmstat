# frozen_string_literal: true

class HomeComponent < ApplicationComponent
  attr_reader :stats, :pagy

  def initialize(stats:, pagy:)
    @stats = stats
    @pagy = pagy
    super
  end
end
