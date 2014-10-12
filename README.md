1. Rename ".env.sample" to ".env"
2. Fill in .env with your twilio information and alert phone number
3. Bundle install


Create an alarm

```
rails c
alarm = Alarm.new
alarm.save
```


- [ ] Add routes & secure them
- [ ] UI Pincode
- [ ] Change background color on motion detected
