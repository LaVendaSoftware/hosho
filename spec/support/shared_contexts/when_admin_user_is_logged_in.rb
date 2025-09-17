shared_context "when admin user is logged in" do
  include_context "when user is logged in" do
    let(:current_user) { create(:admin_user) }
  end
end
