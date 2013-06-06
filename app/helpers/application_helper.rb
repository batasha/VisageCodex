module ApplicationHelper
  def friend_request_count
    current_user.received_friend_requests.where(status: "pending").count
  end

  def message_count
    current_user.messages.where(status: "unread").count
  end

  def notifications_count
    friend_request_count + message_count
  end
end
