# frozen_string_literal: true

class PlayerStatService::Commands::ImportData
  def self.call(...)
    new(...).call
  end

  PERSONAL_ATTRS = %w[uid name position club age wage height left_foot right_foot].freeze

  def initialize(path)
    @doc = Nokogiri::HTML(data_file(path))
  end

  def call
    doc.css('tr').map do |row|
      data = row.css('td')
      next if data.blank?

      attrs = record_attrs(data)
      next if attrs.compact_blank.empty?

      record = PlayerStat.new(attrs)
      next if record.save

      display_error_message(record)
    end
  end

  private

  attr_reader :doc

  def data_file(path)
    abort("This file doesn't exist") unless File.file?(path)

    File.read(path)
  end

  def headers
    @headers ||= headers_row.css('th').map { |val| val.text.strip.parameterize.underscore }
  end

  def headers_row
    doc.css('tr').find { |row| row.css('th').present? }
  end

  def record_attrs(data)
    values = data.map { |val| val.text.strip.gsub(/\d+(,)/, &:chop) }
    attrs = headers.zip(values).to_h
    return {} if attrs.empty?

    stat_attrs = attrs.except(*PERSONAL_ATTRS).transform_values(&:to_f)

    attrs.slice(*PERSONAL_ATTRS).merge(stat: stat_attrs).deep_transform_keys(&:to_sym)
  end

  def display_error_message(record)
    logger.error('*****************************************')
    logger.error("Can't create record")
    logger.error(record.errors.full_messages.join('; '))
  end

  def logger
    @logger ||= Rails.logger
  end
end
