class AddLastFetchedToPartner < ActiveRecord::Migration
  def change
    add_column :partners, :last_fetched, :datetime
  end
end
