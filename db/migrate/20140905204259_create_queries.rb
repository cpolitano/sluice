class CreateQueries < ActiveRecord::Migration
  def change
    create_table :queries do |t|
      t.string :keyword
      t.references :user, index: true
      
      t.timestamps
    end
  end
end
