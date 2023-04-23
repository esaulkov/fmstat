# frozen_string_literal: true

class PlayerStat < ApplicationRecord
  validates :name, presence: true
  validates :position, presence: true
  validates :club, presence: true
  validates :uid, db_uniqueness: true
end
