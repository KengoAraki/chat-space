module MessagesHelper
  def time(message)
    message.created_at.strftime('%Y年%m月%d日 %H:%M')
  end
end