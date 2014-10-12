require "spec_helper"


RSpec.describe Alarm do 
	subject(:alarm) { Alarm.new }
	it 'can be set to home' do 
		alarm.set_home
		expect(alarm.state).to eq('home')
	end
end
