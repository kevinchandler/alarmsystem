require "spec_helper"


RSpec.describe Alarm do 
  subject(:alarm) { Alarm.new }
   
   it 'can be set to home' do 
      alarm.state = 'home'
      alarm.save
      expect(alarm.state).to eq('home')
   end

    it 'can be set to away' do
      alarm.state = 'away'
      alarm.save
      expect(alarm.state).to eq('away')
    end

    it 'alerts the user' do
      alarm.alert

    end
      
end
