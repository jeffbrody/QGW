require 'QGW'

describe "Build Search Transactions XML" do
	let(:quantumClass) {
		Class.new do
			include QGW
		end
	}

	subject { quantumClass.new }

	it "builds a SearchTransactions request for dates" do
		pending
	end

	it "builds a SearchTransactions request for transaction type" do
		pending
	end	

	it "builds a SearchTransactions request for payment type" do
		pending
	end		

	it "builds a SearchTransactions request for Settlement Batch ID" do
		pending
	end		

	it "builds a SearchTransactions request for Settlement Date" do
		pending
	end		

	it "builds a SearchTransactions request for Customer ID" do
		pending
	end			

	it "builds a SearchTransactions request for Transaction Status" do
		pending
	end			
end