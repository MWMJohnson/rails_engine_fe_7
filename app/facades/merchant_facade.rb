class MerchantFacade

  def initialize(params)
    @merchant_id = params[:id]
  end

  def merchants
    make_merchants(service.get_all_merchants)
  end

  def merchant
    make_merchant(service.merchant_details(@merchant_id))
  end

  def make_merchant(json)
    Merchant.new(json[:data])
  end

  def make_merchants(json)
    json[:data].map do | merchant_data|
      Merchant.new(merchant_data)
    end
  end

  def make_items(json)
    json[:data].map do | merchant_items_data|
      Item.new(merchant_items_data)
    end
  end

  def service
    MerchantService.new
  end

  def items
    make_items(service.merchant_items(@merchant_id))
  end

end