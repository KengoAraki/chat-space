json.messages @messages.each do |message|
  json.name message.user.name
  json.date time(message)
  json.body message.body
end