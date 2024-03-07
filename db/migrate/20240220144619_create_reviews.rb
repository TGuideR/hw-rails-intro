#Add data to Review Model
class CreateReviews < ActiveRecord::Migration
  # :reek:FeatureEnvy
  def change
    create_table :reviews do |table|
      table.integer :potatoes
      table.text :comments
      table.references :moviegoer
      table.references :movie
    end
  end
end
