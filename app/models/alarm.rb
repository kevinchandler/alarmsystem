class Alarm < ActiveRecord::Base
  has_many :logs

  def should_alert?
    interval = ENV['alarm_notification_interval'].to_i
    if self.state == 'home'
      return false
    elsif self.logs.empty?
      return true
    elsif self.logs.present? && self.logs.last.created_at < interval.minutes.ago
      return true
    else
      return false
    end
  end


  def alert
	# alert the user that motion was detected from a specific alarm

    @twilio_client = Twilio::REST::Client.new ENV['twilio_sid'], ENV['twilio_token']

    @twilio_client.account.sms.messages.create(
      :from => ENV['twilio_phone_number'],
      :to => ENV['phone_number_to_alert'],
      :body => "Motion Detected at: #{Time.now}. Reply 1 to dismiss"
   )

    # create a log of this alert
    Log.compose(self[:id])

  end


end
