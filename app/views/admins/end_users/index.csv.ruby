# frozen_string_literal: true

require 'csv'

CSV.generate do |csv|
  csv_column_names = %w[Firstname Lastname Email]
  csv << csv_column_names
  @end_users.each do |user|
    csv_column_values = [
      user.first_name,
      user.family_name,
      user.email
    ]
    csv << csv_column_values
  end
end
