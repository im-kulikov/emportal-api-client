require 'blanket'
require 'base64'
require 'awesome_print'

class Client
  def version
    'v1'
  end

  def url
    "https://emportal.ru/api/#{version}/"
  end

  def auth
    {
        Authorization: "Basic #{Base64.encode64( "#{@username}:#{@password}" )}"
    }
  end

  def initialize(username = nil, password = nil)
    @username = username unless username.nil?
    @password = password unless password.nil?

    @client = Blanket.wrap(url, headers: auth)
  end

  def doctors
    @client.doctors.get(params: { json: 1 }).payload
  end

  def addresses
    @client.addresses.get(params: { json: 1 }).payload
  end
end