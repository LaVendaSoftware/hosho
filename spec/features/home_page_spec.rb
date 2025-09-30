describe "Home page" do
  include_context "when user is logged in", :standard

  before { visit(root_path) }

  it { expect(page).to have_http_status(:success) }
  it { expect(page).to have_css("h1", text: "Home") }
  it { expect(page).to have_css("div", text: t("home.page.hey")) }
end
