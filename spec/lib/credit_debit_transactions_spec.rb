require 'QGW'

describe "Build Quantum credit/debit transactions" do
	let(:quantumClass) {
		Class.new do
			include QGW
		end
	}

	subject { quantumClass.new }

	it "builds a debit EFT request" do
		req = subject.build_EFT_debit( 123, '307083665', '020203030', 
										'Checking', 'Trans_ID', 'Acct_ID')
		req.value.should eq "Request"
		req.nodes.length.should eq 8
		req.nodes[0].value.should eq "TransactionType"
		req.nodes[0].nodes[0].should eq 'DEBIT'
		req.nodes[1].value.should eq "PaymentType"
		req.nodes[1].nodes[0].should eq "EFT"
		req.nodes[2].value.should eq "ABANumber"
		req.nodes[2].nodes[0].should eq '307083665'
		req.nodes[3].value.should eq "AccountNumber"
		req.nodes[3].nodes[0].should eq "020203030"	
		req.nodes[4].value.should eq "AccountType"
		req.nodes[4].nodes[0].should eq "Checking"		
		req.nodes[5].value.should eq "InvoiceNumber"
		req.nodes[5].nodes[0].should eq "Trans_ID"	
		req.nodes[6].value.should eq "InvoiceDescription"
		req.nodes[6].nodes[0].should eq "Acct_ID"		
		req.nodes[7].value.should eq "MerchantEmail"
		req.nodes[7].nodes[0].should eq "Y"
	end
end