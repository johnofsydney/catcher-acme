# require 'faraday'

class Document < ApplicationRecord
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
