describe GeneratePID do
  describe "#call" do
    subject(:service) { described_class.call(prefix) }

    let(:prefix) { nil }

    it { expect(service).to be_a(String) }

    context "when pass prefix" do
      let(:prefix) { "prefix_text" }

      it { expect(service).to start_with("#{prefix}_".upcase) }
    end
  end
end
