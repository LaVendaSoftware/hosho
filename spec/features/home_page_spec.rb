describe "Home page" do
  before { visit(root_path) }

  it { expect(page).to have_http_status(:success) }
  it { expect(page).to have_css("h1", text: "Hosho") }
  it { expect(page).to have_css("div", text: I18n.t("hey")) }
end
