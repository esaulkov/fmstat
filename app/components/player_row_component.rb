# frozen_string_literal: true

class PlayerRowComponent < ApplicationComponent
  with_collection_parameter :player

  attr_reader :player

  def initialize(player:)
    @player = player
    super
  end
end
