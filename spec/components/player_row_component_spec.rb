# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PlayerRowComponent, type: :component do
  let(:player) { create(:player_stat) }
  let(:player_iteration) { double('player_iteration', index: 1) } # rubocop:disable RSpec/VerifiedDoubles
  let(:component) { described_class.new(player: player, player_iteration: player_iteration) }

  describe '#row_css_class' do
    it 'returns "bg-gray-100" if the iteration index is odd' do
      expect(component.row_css_class).to eq('bg-gray-100')
    end

    it 'returns an empty string if the iteration index is even' do
      allow(player_iteration).to receive(:index).and_return(2)
      expect(component.row_css_class).to eq('')
    end
  end
end
