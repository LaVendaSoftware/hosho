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

  describe "#has_permission?" do
    subject(:user) { described_class.new(role: user_role) }

    context "when the user is standard" do
      let(:user_role) { :standard }

      it "has permission for :standard" do
        expect(user).to have_permission(:standard)
      end

      it "does not have permission for :seller" do
        expect(user).not_to have_permission(:seller)
      end
    end

    context "when the user is manager" do
      let(:user_role) { :manager }

      it "has permission for :seller" do
        expect(user).to have_permission(:seller)
      end

      it "has permission for :manager" do
        expect(user).to have_permission(:manager)
      end

      it "does not have permission for :admin" do
        expect(user).not_to have_permission(:admin)
      end
    end

    context "when the user is admin" do
      let(:user_role) { :admin }

      it "has permission for :manager" do
        expect(user).to have_permission(:manager)
      end

      it "has permission for :admin" do
        expect(user).to have_permission(:admin)
      end

      it "does not have permission for :developer" do
        expect(user).not_to have_permission(:developer)
      end
    end

    context "when the user is developer" do
      let(:user_role) { :developer }

      it "has permission for every role" do
        described_class.roles.keys.each do |role|
          expect(user).to have_permission(role)
        end
      end
    end
  end
end
