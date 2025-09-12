describe RemoveDuplicatedSpaces do
  describe "#call" do
    subject { described_class.call(string) }

    context "when the string is nil" do
      let(:string) { nil }

      it { is_expected.to be_blank }
    end

    context "when the string is empty" do
      let(:string) { "" }

      it { is_expected.to be_blank }
    end

    context "when the string has no extra spaces" do
      let(:string) { "Hello world" }

      it { is_expected.to eq("Hello world") }
    end

    context "when the string has multiple spaces between words" do
      let(:string) { "Hello    world" }

      it { is_expected.to eq("Hello world") }
    end

    context "when the string has leading and trailing spaces" do
      let(:string) { "   Hello world   " }

      it { is_expected.to eq("Hello world") }
    end

    context "when the string has multiple spaces and new lines" do
      let(:string) { "Hello    world\n  This   is  a   test" }

      it { is_expected.to eq("Hello world\n This is a test") }
    end
  end
end
