class CreateFfnis < ActiveRecord::Migration[5.2]
  def change
    create_table :ffnis do |t|
      t.string :topic
      t.string :media
      t.string :content
      t.string :badge
      t.string :upvotes
      t.string :downvotes
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
