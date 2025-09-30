describe "Categories list" do
  before do
    before_visit if defined?(before_visit)

    visit(categories_path)
  end

  context "when user is a least seller" do
    include_context "when user is logged in", :manager

    it { expect(page).to have_http_status(:success) }
    it { expect(page).to have_css("h1", text: h.tm(Category)) }
    it { expect(page).to have_current_path(categories_path) }

    context "when have some categories" do
      include_context "when there is an category"
      let(:before_visit) { category }

      it { expect(page).to have_http_status(:success) }
    end

    context "when categories does not exits" do
      it_behaves_like "have not found record for", Category, :female
    end
  end

  it_behaves_like "user does not have permission as", [:seller, :standard]
end
