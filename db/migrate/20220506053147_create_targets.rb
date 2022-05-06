class CreateTargets < ActiveRecord::Migration[6.1]
  def change
    create_table :targets do |t|

      t.integer :user_id
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end