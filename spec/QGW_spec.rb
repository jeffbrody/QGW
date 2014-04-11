require 'QGW'

describe "Build overall Quantum request XML" do
	let(:quantumClass) {
		Class.new do
			include QGW
		end
	}

	subject { quantumClass.new }

	its (:mod_version) { should eq '0.0.1'}

	it "Should let me set the Username & Key" do
		subject.set_login_info( 'username', 'key').should eq "key"
	end

	it "Should build an Auth element" do
		username = "UserName"
		key = "Key"
		subject.set_login_info( username, key)
		auth = subject.build_Auth_element
		auth.value.should eq "Authentication"
		auth.nodes.length.should eq 2
		auth.nodes[0].value.should eq "GatewayLogin"
		auth.nodes[0].nodes[0].should eq username
		auth.nodes[1].value.should eq "GatewayKey"
		auth.nodes[1].nodes[0].should eq key
	end

	its (:build_XML_request) { 
		should =~ /<QGWRequest>/ 
		should =~ /<Authentication>/ 
		should =~ /<GatewayLogin>default<\/GatewayLogin>/ 
		should =~ /<GatewayKey>default<\/GatewayKey>/ 				
		should =~ /<\/Authentication>/ 
		should =~ /<Request>default<\/Request>/		
		should =~ /<\/QGWRequest>/ 
	}

	it "Should be able to clear the last request" do
		req = subject.clear_request
		req.value.should eq "Request"
		req.nodes.length.should eq 0
	end

	it "Should be able to create standalone nodes with text" do
		node = subject.make_node("Node value", "Node text")
		node.value.should eq "Node value"
		node.nodes[0].should eq "Node text"
	end
end

describe "Send request to Quantum Gateway" do
	let(:quantumClass) {
		Class.new do
			include QGW
		end
	}

	subject { quantumClass.new }	

	it "Should return the response object after submitting request" do
		RestClient = double("RestClient")
		xml = subject.build_XML_request
		resp = %q{ <ResponseSummary>
			<RequestType>ShowTransactionDetail</RequestType>
			<Status>Error</Status>
			<StatusDescription>Transaction not found</StatusDescription>
			<ResultCount>0</ResultCount>
			<TimeStamp>8/20/2003 8:34:28 AM</TimeStamp>
			</ResponseSummary>
		}
		respOx = Ox.parse(resp)
		RestClient.should_receive(:post).with(
			"https://secure.quantumgateway.com/cgi/xml_requester.php", "#{xml}").
			and_return(resp)

		retval = subject.submit(xml)
		retval.should == respOx
	end

	it "Should deal with errors connecting to site" do
		pending
	end
end
