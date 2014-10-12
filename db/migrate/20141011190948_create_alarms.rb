class CreateAlarms < ActiveRecord::Migration
  def change
    create_table :alarms do |t|
      t.string :state

      t.timestamps
    end


  end
end
