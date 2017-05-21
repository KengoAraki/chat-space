class Message < ApplicationRecord
  belongs_to :group
  belongs_to :user

  validates :body, presence: true

  def time
    "#{created_at.strftime('%Y年%m月%d日 %H:%M')}"
  end
end
