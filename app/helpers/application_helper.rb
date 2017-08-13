module ApplicationHelper
  def avatar_url(user)

    if user.image
      "http://graph.facebook.com/#{user.uid}/picture?type=large"
    
    end
  end
end
