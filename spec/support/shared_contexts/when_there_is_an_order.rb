shared_context "when there is an order" do
  let(:category) { create(:category, company: current_company) }
  let(:product) { create(:product, category:) }
  let(:items) do
    create_list(:product_variant, 2, product:).map do |product_variant|
      build(:order_item, product_variant:, order: nil)
    end
  end

  let(:order) { create(:order, items:) }
end
