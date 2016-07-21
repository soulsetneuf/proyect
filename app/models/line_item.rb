class LineItem < ActiveRecord::Base
  belongs_to :insumo_reactivo
  belongs_to :cart

  def total_price
    1 * quantity
  end
end
