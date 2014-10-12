1. Rename ".env.sample" to ".env"
2. Fill in .env with your twilio information and alert phone number
3. Bundle install


Create an alarm

```
rails c
alarm = Alarm.new
alarm.save
```


- [x] Add routes & secure them
- [ ] UI Pincode
- [ ] Change background color on motion detected




1. Have your motion sensor make POST requests to /alarms/:id/motion_detected?alarm_passcode='YOUR_ALARM_PASSCODE'
