class OrderItemsController < ApplicationController
  def new
    @order_item = OrderItem.new(order_item_params)
    @order_item.unit_price = product_variant.price.to_d
    @order_item.subtotal = product_variant.price.to_d * @order_item.quantity.to_i

    render json: @order_item
  end

  private

  def order_item_params
    params.permit(:product_variant_id, :quantity)
  end

  def product_variant
    @product_variant ||=
      ProductVariantRepo.new(ProductVariant)
        .by_company(current_company)
        .find_or_initialize_by(id: params[:product_variant_id])
  end
end
