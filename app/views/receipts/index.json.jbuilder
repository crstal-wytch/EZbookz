json.array!(@receipts) do |receipt|
  json.extract! receipt, :id, :name, :address, :email, :pay_type
  json.url receipt_url(receipt, format: :json)
end
