json.array!(@alarms) do |alarm|
  json.extract! alarm, :id, :state, :reference
  json.url alarm_url(alarm, format: :json)
end
