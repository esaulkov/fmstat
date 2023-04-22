# frozen_string_literal: true

require 'rails_helper'

describe PlayerStatService::Commands::ImportData do
  describe '#call' do
    subject(:import_data) { described_class.new(path).call }

    let(:path) { Rails.root.join('spec/fixtures/import_data.html') }

    it 'skips empty rows and creates records in database' do
      expect { import_data }.to change(PlayerStat, :count).by(2)
    end

    context 'when something goes wrong' do
      let(:player_stat_double) { instance_double(PlayerStat, save: false, errors: errors) }
      let(:errors) { instance_double(ActiveModel::Errors, full_messages: ['Record is not valid']) }

      before do
        allow(PlayerStat).to receive(:new).and_return(player_stat_double)
        allow(Rails.logger).to receive(:error)
      end

      it 'skips row' do
        expect { import_data }.not_to change(PlayerStat, :count)
      end

      it 'sends error to log' do
        import_data
        expect(Rails.logger).to have_received(:error).with('Record is not valid').twice
      end
    end
  end
end
