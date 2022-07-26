class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|

      t.string      :title
      t.string      :short_description
      t.text        :description, null: true
      t.integer     :status, null: false, default: 0
      t.integer     :post_type, null: false, default: 0
      t.references  :user, foreign_key: true

      t.timestamps
    end
  end
end
