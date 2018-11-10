class CreateFfnis < ActiveRecord::Migration[5.2]
  def change
    create_table :ffnis do |t|
      t.string :topic
      t.string :media
      t.string :content
      t.string :badge
      t.string :upvotes, default: 0
      t.string :downvotes, default: 0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
