class AddActionToLogs < ActiveRecord::Migration[7.0]
  def change
    add_column :logs, :action, :string
  end
end
