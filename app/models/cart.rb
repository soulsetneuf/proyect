class Cart < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy

  def add_product(product_id)
    insumo_reactivo = InsumoReactivo.find(product_id)
    cantidad_insumo_reactivo = insumo_reactivo.cantidad
    #if cantidad_insumo_reactivo_cart>=cantidad_insumo_reactivo
        current_item = line_items.find_by(insumo_reactivo_id: product_id)
        if current_item
          #if current_item.quantity<cantidad_insumo_reactivo-1
            current_item.quantity += 1
          #end
        else
          #if cantidad_insumo_reactivo>0
            current_item = line_items.build(insumo_reactivo_id: product_id)
          #end
        end
        current_item
    #end
  end

  def total_price
    line_items.to_a.sum{ |item| item.total_price}
  end
end
