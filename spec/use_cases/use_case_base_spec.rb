describe UseCaseBase do
  subject(:ucase) { described_class.new }

  it { expect(ucase).to be_a(described_class) }
end
