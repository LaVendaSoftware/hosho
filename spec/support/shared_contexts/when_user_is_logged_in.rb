shared_context "when user is logged in" do
  before do
    visit(new_session_path)

    fill_in(User.human_attribute_name(:email_address), with: current_user.email_address)
    fill_in(User.human_attribute_name(:password), with: current_user.password)

    click_on("Login")
  end

  let(:current_user) { create(:user, company_ids: [current_company_id]) }
  let(:current_company) { create(:company) }
  let(:current_company_id) { current_company.id }
  let(:current_company_pid) { current_company.pid }
end
