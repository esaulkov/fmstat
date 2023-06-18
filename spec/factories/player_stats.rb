# frozen_string_literal: true

FactoryBot.define do
  factory :player_stat do
    sequence(:name) { |n| "Player #{n}" }
    age { rand(18..35) }
    position { 'CD' }
    sequence(:club) { |n| "Club #{n}" }
    stat { { 'apps' => 24, 'gls' => 42, 'av_rat' => 7.89 } }
  end
end
