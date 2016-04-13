class RevenueFinder
  def initialize(params)
    @date = params[:date]
    @merchant = params[:id]
  end

  def find_revenue
    return ["revenue", Merchant.find(@merchant).revenue_by_date(@date)] if @date && @merchant
    return ["total_revenue", Invoice.revenue_by_date(@date)] if @date
    return ["revenue", Merchant.find(@merchant).revenue] if @merchant
  end
end
