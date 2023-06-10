# frozen_string_literal: true

class PlayerRowComponent < ApplicationComponent
  with_collection_parameter :player

  attr_reader :player

  def initialize(player:, player_iteration:)
    @player = player
    @iteration = player_iteration
    super
  end

  def row_css_class
    @iteration.index.odd? ? 'bg-gray-100' : ''
  end
end
