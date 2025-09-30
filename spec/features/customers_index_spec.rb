describe "Customers list" do
  before do
    before_visit if defined?(before_visit)

    visit(customers_path)
  end

  context "when user is a least seller" do
    include_context "when user is logged in", :seller

    it { expect(page).to have_http_status(:success) }
    it { expect(page).to have_css("h1", text: h.tm(Customer)) }
    it { expect(page).to have_current_path(customers_path) }

    context "when have some customers" do
      let(:before_visit) do
        user = create(:user, company_ids: [current_company_id])

        create(:customer, user:)
      end

      it { expect(page).to have_http_status(:success) }
    end

    context "when customers does not exits" do
      it_behaves_like "have not found record for", Customer, :male
    end
  end

  it_behaves_like "user does not have permission as", [:standard]
end
