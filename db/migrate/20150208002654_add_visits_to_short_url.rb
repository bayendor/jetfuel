class AddVisitsToShortUrl < ActiveRecord::Migration
  def change
    add_column :short_urls, :visits, :integer, default: 0
  end
end
