class AddDefaultHomeStateToAlarm < ActiveRecord::Migration
  def change
    remove_column :alarms, :state
    add_column :alarms, :state, :string, default: 'home'
  end
end
