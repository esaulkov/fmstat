# frozen_string_literal: true

class PlayerStatService
  def import_data(path)
    PlayerStatService::Commands::ImportData.call(path)
  end
end
