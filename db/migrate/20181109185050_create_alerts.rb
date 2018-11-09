class CreateAlerts < ActiveRecord::Migration[5.2]
  def change
    create_table :alerts do |t|
      t.references :ffni, foreign_key: true
      t.string :review

      t.timestamps
    end
  end
end
