class Invoice
  require 'bigdecimal'

  attr_accessor :state, :subtotal

  def initialize(args = {})
    @subtotal = args[:subtotal]
  end

  def sales_tax
    case state
    when "CA"
      return @subtotal * 0.1
    when "FL"
      return @subtotal * BigDecimal('0.07')
    else
      return 'State unknown'
    end
  end

  def service_fee
    @subtotal / 0.8 - @subtotal
  end

  def total
    @subtotal + sales_tax + service_fee
  end

end