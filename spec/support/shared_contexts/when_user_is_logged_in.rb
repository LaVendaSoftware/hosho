shared_context "when user is logged in" do
  before do
    visit(new_user_session_path)

    fill_in(User.human_attribute_name(:email), with: current_user.email)
    fill_in(User.human_attribute_name(:password), with: current_user.password)

    click_on("Log in")
  end

  let(:current_user) { create(:user) }
end
