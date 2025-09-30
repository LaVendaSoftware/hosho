shared_context "when there is an order" do
  include_context "when there is an product"

  let(:order_items) do
    create_list(:product_variant, 2, product:).map do |product_variant|
      build(:order_item, product_variant:, order: nil)
    end
  end

  let(:order) { create(:order, items: order_items) }
end
