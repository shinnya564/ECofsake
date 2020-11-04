# frozen_string_literal: true

require 'csv'

CSV.generate do |csv|
  csv_column_names = %w[Name Invalid_status]
  csv << csv_column_names
  @types.each do |type|
    csv_column_values = [
      type.name,
      type.invalid_status
    ]
    csv << csv_column_values
  end
end
