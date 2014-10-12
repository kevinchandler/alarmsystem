class AlarmsController < ApplicationController
  before_action :set_alarm, only: [:show, :edit, :update, :destroy]

  # GET /alarms
  # GET /alarms.json
  def index
  end

  # GET /alarms/1
  # GET /alarms/1.json
  def show
    @alarm = Alarm.find(params[:id])
  end

  # GET /alarms/new
  def new
    @alarm = Alarm.new
  end
  
  def status
    alarm = Alarm.find(params[:id])
    alarm.state = params[:status]
    alarm.save
  end

  def motion_detected
    alarm = Alarm.find(params[:id])
    if params[:alarm_passcode].to_s == ENV['alarm_passcode'].to_s
      if alarm.should_alert?
        alarm.alert
        return render :status => 200, :json => {}
      else
        render :status => 204, :json => {}
      end
    else
      render :status => 422, :json => {reason: 'Incorrect Passcode'}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alarm
      @alarm = Alarm.find(1)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alarm_params
      params.require(:alarm).permit(:state, :alarm_passcode)
    end
end
