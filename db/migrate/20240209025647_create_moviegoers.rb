#Add data to User Model
class CreateMoviegoers < ActiveRecord::Migration
  #:reek:FeatureEnvy
  def change
    create_table :moviegoers do |table|
      table.string :name
      table.string :provider
      table.string :uid

      table.timestamps null: false
    end
  end
end
