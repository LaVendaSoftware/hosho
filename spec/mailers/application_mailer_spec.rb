describe ApplicationMailer do
  subject(:mailer) { described_class.new }

  it { expect(mailer).to be_a(described_class) }
end
