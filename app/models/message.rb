class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  validates_presence_of :content, :conversation_id, :user_id
  after_create_commit :create_notification

  def message_time
    self.created_at.strftime("%v")
  end

  private

  def create_notification
    if self.conversation.sender_id == self.user_id
      sender = User.find(self.conversation.sender_id)
      Notification.create(content: "New messages from #{sender.fullname}", user_id: self.conversation.recipient_id)
    else
      sender = User.find(self.conversation.recipient_id)
      Notification.create(content: "New messages from #{sender.fullname}", user_id: self.conversation.sender_id)
    end
  end
end
