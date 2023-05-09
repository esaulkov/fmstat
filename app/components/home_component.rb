# frozen_string_literal: true

class HomeComponent < ApplicationComponent
  attr_reader :stats

  def initialize(stats:)
    @stats = stats
    super
  end
end
