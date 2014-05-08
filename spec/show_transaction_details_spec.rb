require 'QGW'

describe "Build Find Transaction Details XML" do
	let(:quantumClass) {
		Class.new do
			include QGW
		end
	}

	subject { quantumClass.new }

	it "builds a ShowTransactionDetails request for specific trans ID" do
		req = subject.build_show_transaction_details("ID")
		req.value.should eq "Request"
		req.nodes.length.should eq 2
	end

		
end