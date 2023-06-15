# frozen_string_literal: true

class PlayerStat < ApplicationRecord
  SORTED_COLS = %w[apps gls av_rat].freeze

  validates :name, presence: true
  validates :position, presence: true
  validates :club, presence: true
  validates :uid, db_uniqueness: true

  def self.sorted_cols
    SORTED_COLS
  end
end
