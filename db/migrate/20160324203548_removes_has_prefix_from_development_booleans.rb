class RemovesHasPrefixFromDevelopmentBooleans < ActiveRecord::Migration
  def change
    [
      "has_gym",
      "has_pool",
      "has_spa",
      "has_sauna",
      "has_steam_room",
      "has_rooftop_deck"
    ].each do |column_name|
      rename_column :developments, column_name, column_name.gsub('has_', '')
    end
  end
end
