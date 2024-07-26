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

  after_create_commit do
    broadcast_append_to(
      :documents,
      target: "document-list",
      html: "
        <tr>
          <td>#{self.description}</td>
          <td>#{self.link}</td>
          <td>#{self.token}</td>
          <td><a href='/documents/#{self.id}' class='button is-small is-info'>Show</a></td>
        </tr>
      "
    )
  end

  def is_image?
    return false unless self.link.present?

    self.link.ends_with?('.jpg', '.jpeg', '.png', '.gif', '.avif')
  end
end
