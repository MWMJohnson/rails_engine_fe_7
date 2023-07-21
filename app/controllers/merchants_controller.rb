class MerchantsController < ApplicationController
  def index
    @facade = MerchantFacade.new(params)
  end

  def show
    @facade = MerchantFacade.new(params)
  end
end