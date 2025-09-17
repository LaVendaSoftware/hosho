describe User do
  subject(:user) { build(:user) }

  it { expect(user).to be_valid }

  context "when user is authenticatable" do
    subject(:user) { create(:user, password: Faker::Internet.password) }

    let(:found_user) do
      described_class.authenticate_by(password: user.password, email_address: user.email_address)
    end

    it { expect(found_user).to be_present }
  end
end
