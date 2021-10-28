class CreateSubmissions < ActiveRecord::Migration[6.1]
  def change
    create_table :submissions do |t|
      t.string :project_name
      t.string :url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
