module UsersHelper
  def gravatar_for(user, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "http://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end    
end

# Here we make a URL for a Gravatar image from the user's email address. We are putting that url in gravatar_url. That's all you need to know.
# At the end an img tag is created using the image_tag method. This then shows the image we receive from the gravatar.