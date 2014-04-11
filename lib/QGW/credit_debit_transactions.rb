module QGW
	def build_EFT_debit(amount, aba_number, 
						bank_acct_number, 
						bank_acct_type,
						transaction_id,
						account_id)
		clear_request

		@req << make_node("TransactionType", "DEBIT")
		@req << make_node("PaymentType", "EFT")
		@req << make_node("ABANumber", aba_number)
		@req << make_node("AccountNumber", bank_acct_number)
		@req << make_node("AccountType", bank_acct_type)	
		@req << make_node("InvoiceNumber", transaction_id)
		@req << make_node("InvoiceDescription", account_id)
		@req << make_node("MerchantEmail", "Y")	
	end
end
