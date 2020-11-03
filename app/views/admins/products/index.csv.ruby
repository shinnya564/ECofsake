# frozen_string_literal: true

require 'csv'

CSV.generate do |csv|
  csv_column_names = %w[Type_id Name Introduction Price_excluding
Image_id Out_of_stock]
  csv << csv_column_names
  @products.each do |product|
    csv_column_values = [
      product.type_id,
      product.name,
      product.introduction,
      product.price_excluding,
      product.image_id,
      product.out_of_stock
    ]
    csv << csv_column_values
  end
end
