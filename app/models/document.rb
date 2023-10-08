require 'faraday'

class Document < ApplicationRecord
  LIBRARY_SERVER = "http://localhost:3000"
  LIBRARY_ENDPOINT = "/documents/"


  after_update :get_latest_version

  def get_latest_version
    # TODO fetch the latest version of the document from the library LIBRARY_SERVER
  end
end
