describe User do
  context "when user is standard" do
    subject(:user) { build(:user) }

    it { expect(user).to be_valid }
  end

  context "when user is seller" do
    subject(:user) { build(:seller_user, company_ids: [create(:company).id]) }

    it { expect(user).to be_valid }
  end

  context "when user is manager" do
    subject(:user) { build(:manager_user, company_ids: [create(:company).id]) }

    it { expect(user).to be_valid }
  end

  context "when user is admin" do
    subject(:user) { build(:admin_user) }

    it { expect(user).to be_valid }
  end

  context "when user is developer" do
    subject(:user) { build(:developer_user) }

    it { expect(user).to be_valid }
  end

  context "when user is authenticatable" do
    subject(:user) { create(:user, password: Faker::Internet.password) }

    let(:found_user) do
      described_class.authenticate_by(password: user.password, email_address: user.email_address)
    end

    it { expect(found_user).to be_present }
  end
end
