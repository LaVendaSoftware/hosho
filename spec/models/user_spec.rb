describe User do
  subject(:user) { build(:user) }

  it { expect(user).to be_valid }

  context "when user is authenticatable" do
    subject(:user) { create(:user, password:) }

    let(:password) { Faker::Internet.password }

    it { expect(user).to be_valid_password(password) }
  end
end
