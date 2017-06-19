json.messages @messages.each do |message|
  json.name message.user.name
  json.time time(message)
  json.body message.body
end