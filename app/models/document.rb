# require 'faraday'

class Document < ApplicationRecord
  # this hotwire event requires redis to be running
  #
  # https://blog.kiprosh.com/broadcasting-your-turbo-streams-as-you-want-them-in-rails-7/

  after_update_commit do
    broadcast_replace_to(
      :document,
      target: "main-document-image",
      html: "<img id='main-document-image' src='#{self.link}' alt='Document Image'>",
    )
  end

  def is_image?
    return false unless self.link.present?

    self.link.ends_with?('.jpg', '.jpeg', '.png', '.gif', '.avif')
  end
end
