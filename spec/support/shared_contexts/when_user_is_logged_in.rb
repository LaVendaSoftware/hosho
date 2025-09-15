shared_context "when user is logged in" do
  before { login_as(current_user) }

  let(:current_user) { create(:user) }
end
