class CreateLogsTable < ActiveRecord::Migration
  def change
   create_table :logs do |t|
    	t.references :alarm
    end
  end
end
