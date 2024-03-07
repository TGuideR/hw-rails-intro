#Add data to Movie Model
class CreateMovies < ActiveRecord::Migration
  # :reek:FeatureEnvy
  def change
    create_table :movies do |table|
      table.string :title
      table.string :rating
      table.text :description
      table.datetime :release_date
      # Add fields that let Rails automatically keep track
      # of when movies are added or modified:
      table.timestamps
    end
  end
end
