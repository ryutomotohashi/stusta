class CreateTargetComments < ActiveRecord::Migration[6.1]
  def change
    create_table :target_comments do |t|

      t.integer :user_id
      t.integer :target_id
      t.text :comment

      t.timestamps
    end
  end
end
