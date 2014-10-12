class Alarm < ActiveRecord::Base
  has_many :logs

  def should_alert?
    last_alerted = self.logs.last.created_at
    if last_alerted
      if last_alerted < 2.minutes.ago
        return true
      else
        return false
      end
    else
      return true # no logs created
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
