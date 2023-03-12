# frozen_string_literal: true

RSpec.configure do |config|
  if ENV['DEPRECATION_TRACKER']
    DeprecationTracker.track_rspec(
      config,
      shitlist_path: 'spec/support/deprecation_warning.shitlist.json',
      mode: ENV['DEPRECATION_TRACKER'],
      transform_message: ->(message) { message.gsub("#{Rails.root}/", '') } # rubocop:disable Rails/FilePath
    )
  end
end
