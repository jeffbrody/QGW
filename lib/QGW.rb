require "QGW/version"
require 'xml-fu'

module QGW
  def initialize
	   @key = "default"
	   @username = "default"
	   @req = "default"
   end

  def set_login_info( username, key )
  	@username = username
  	@key = key
  end

  def mod_version
  	VERSION
  end

  def build_base_request
  	auth = { 'GatewayLogin' => @username, 'GatewayKey' => @key}
  	request = {'QGWRequest'=> {'Authentication'=> auth, 'Request'=> @req}}
  	XmlFu.xml(request)
  end
end
