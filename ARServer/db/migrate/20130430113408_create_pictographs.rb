class CreatePictographs < ActiveRecord::Migration
  def change
    create_table :pictographs do |t|
      t.string :text

      t.timestamps
    end
  end
end
