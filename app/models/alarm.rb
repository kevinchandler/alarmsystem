class Alarm < ActiveRecord::Base
  has_many :logs
 
  def set_home
    self.state = 'home'
    self.save
  end

  def set_away
    self.state = 'away'
    self.save
  end
	
  def should_alert?
    last_alerted = self.logs.last.created_at
    if last_alerted >= 2.minutes.ago 
	Log.comopse(self.id)
	true 
    else 
    	false
    end
  end

  def alert
    // do stuff to alert 
  end


end
