shared_examples "user does not have permission as" do |roles|
  roles.each do |role|
    context "when user role is :#{role}" do
      include_context "when user is logged in", role

      it { expect(page).to have_current_path(root_path) }
    end
  end
end
