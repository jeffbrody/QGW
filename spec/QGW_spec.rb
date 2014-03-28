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
		s = quantumClass.new
		s.set_login_info( 'username', 'key').should eq "key"
	end

	its (:build_base_request) { 
		should =~ /<QGWRequest>/ 
		should =~ /<Authentication>/ 
		should =~ /<GatewayLogin>default<\/GatewayLogin>/ 
		should =~ /<GatewayKey>default<\/GatewayKey>/ 				
		should =~ /<\/Authentication>/ 
		should =~ /<Request>default<\/Request>/		
		should =~ /<\/QGWRequest>/ 
	}
end