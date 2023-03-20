class CreateLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :logs do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.references :loggable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
