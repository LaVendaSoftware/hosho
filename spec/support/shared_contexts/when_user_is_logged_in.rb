shared_context "when user is logged in" do
  before do
    visit(new_session_path)

    fill_in(User.human_attribute_name(:email_address), with: current_user.email_address)
    fill_in(User.human_attribute_name(:password), with: current_user.password)

    click_on("Login")
  end

  let(:current_user) { create(:user) }
end
