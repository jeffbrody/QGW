require 'ox'
require 'rest-client'

module QGW
  def initialize
	   @key = "default"
	   @username = "default"
	   @req = Ox::Element.new("Request")
     @req << "default"
  end

  def set_login_info( username, key )
  	@username = username
  	@key = key
  end

  def mod_version
  	VERSION
  end

  def build_XML_request
    req = Ox::Element.new("QGWRequest")
    auth = build_Auth_element
    req << auth
    req << @req
  	xml = Ox.dump(req)
  end

  def submit(xml)
    url = 'https://secure.quantumgateway.com/cgi/xml_requester.php'

    result = RestClient.post url, xml, content_type: "text/xml"
    print result
    Ox.parse(result)

  end

  def build_Auth_element
    auth = Ox::Element.new("Authentication")
    login = make_node("GatewayLogin", @username)
    auth << login
    key = make_node("GatewayKey", @key)
    auth << key
  end

  def clear_request
    @req.nodes.clear
    @req
  end

  def make_node(node_value, node_text)
    node = Ox::Element.new(node_value)
    node << node_text
  end

end

require "QGW/version"
require 'QGW/credit_debit_transactions'
require 'QGW/search_transactions'
require 'QGW/show_transaction_details'
