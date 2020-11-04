# frozen_string_literal: true

require 'csv'

CSV.generate do |csv|
  csv_column_names = %w[first_name last_name email kana_family_name kana_first_name postal_code address tel delete_status]
  csv << csv_column_names
  @end_users.each do |user|
    csv_column_values = [
      user.first_name,
      user.family_name,
      user.email,
      user.kana_family_name,
      user.kana_first_name,
      user.postal_code,
      user.address,
      user.tel.to_s,
      user.delete_status
    ]
    csv << csv_column_values
  end
end
