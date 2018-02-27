module ApplicationHelper
  def avatar_url(user)
    if user.image
      "http://graph.facebook.com/#{user.uid}/picture?type=large"

    else
      gravatar_id = Digest::MD5::hexdigest(user.email).downcase
      "http://gravatar.com/avatar/#{gravatar_id}.png?s=150&d=https://houseclip.properties/images/Logo150.png"
    end
  end
  def stripe_express_path
    "https://connect.stripe.com/express/oauth/authorize?response_type=code&client_id=ca_BfMAoMggW3Vrhjs12dmECe9KXrml4mCd&scope=read_write"

  end
end
