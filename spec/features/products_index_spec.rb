describe "Products list" do
  before do
    before_visit if defined?(before_visit)

    visit(products_path)
  end

  context "when user is a least seller" do
    include_context "when user is logged in", :manager

    it { expect(page).to have_http_status(:success) }
    it { expect(page).to have_css("h1", text: h.tm(Product)) }
    it { expect(page).to have_current_path(products_path) }

    context "when have some products" do
      include_context "when there is an product"
      let(:before_visit) { product }

      it { expect(page).to have_http_status(:success) }
    end

    context "when products does not exits" do
      it_behaves_like "have not found record for", Product, :male
    end
  end

  it_behaves_like "user does not have permission as", [:seller, :standard]
end
