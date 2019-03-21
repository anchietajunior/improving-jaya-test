class UpdateEventsAttributes < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :issue, foreign_key: true
    rename_column :events, :params, :action
  end
end
