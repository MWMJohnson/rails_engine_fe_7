class MerchantService

  def get_all_merchants
    get_url("merchants")
  end

  def merchant_details(merchant_id)
    get_url("merchants/#{merchant_id}")
  end
  
  def merchant_items(merchant_id)
    get_url("merchants/#{merchant_id}/items")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "http://localhost:3000/api/v1/")
  end
end