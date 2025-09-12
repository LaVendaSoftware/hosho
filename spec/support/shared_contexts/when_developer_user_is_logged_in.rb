shared_context "when developer user is logged in" do
  include_context "when user is logged in" do
    let(:current_user) { create(:developer_user) }
  end
end
