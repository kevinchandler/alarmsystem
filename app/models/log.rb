class Log < ActiveRecord::Base
  belongs_to :alarm

  def self.compose(alarm_id)
    log = Log.new
    log.alarm_id = alarm_id
    log.save
  end

end
