class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :plot_summary
      t.string :img_url
      t.integer :run_time

      t.timestamps
    end
  end
end
