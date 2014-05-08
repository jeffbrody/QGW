module QGW
	def build_EFT_debit(amount, aba_number, 
						bank_acct_number, 
						bank_acct_type,
						cs_transaction_id,
						cs_account_id)
		clear_request

		@req << make_node("RequestType", "ProcessSingleTransaction")
		@req << make_node("TransactionType", "DEBIT")
		@req << make_node("PaymentType", "EFT")
		@req << make_node("ABANumber", aba_number)
		@req << make_node("AccountNumber", bank_acct_number)
		@req << make_node("AccountType", bank_acct_type)	
		@req << make_node("InvoiceNumber", cs_transaction_id)
		@req << make_node("InvoiceDescription", cs_account_id)
		@req << make_node("MerchantEmail", "Y")	
	end
end
