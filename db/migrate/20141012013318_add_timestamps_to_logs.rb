class AddTimestampsToLogs < ActiveRecord::Migration
  def change
    change_table :logs do |t|
    	t.timestamps
    end
  end
end
