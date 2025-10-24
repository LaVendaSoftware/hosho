shared_context "when there is an product" do
  include_context "when there is an category"

  let(:product) { create(:product, category:, company: current_company) }
end
