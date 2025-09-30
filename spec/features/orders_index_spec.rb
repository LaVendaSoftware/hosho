describe "Orders list" do
  include_context "when user is logged in"

  before do
    before_visit if defined?(before_visit)

    visit(orders_path)
  end

  it { expect(page).to have_http_status(:success) }
  it { expect(page).to have_css("h1", text: h.tm(Order)) }

  context "when have some orders" do
    include_context "when there is an order"

    let(:before_visit) { order }

    it { expect(page).to have_http_status(:success) }
  end

  context "when orders does not exits" do
    it_behaves_like "have not found record for", Order
  end
end
