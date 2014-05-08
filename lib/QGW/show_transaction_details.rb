module QGW
	def build_show_transaction_details(transaction_id)
		clear_request

		@req << make_node("RequestType", "ShowTransactionDetails")
		@req << make_node("ID", transaction_id)
	
	end
end
