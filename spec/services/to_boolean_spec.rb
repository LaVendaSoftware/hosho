RSpec.describe ToBoolean do
  describe "#call" do
    subject { described_class.call(value) }

    context "when value is nil" do
      let(:value) { nil }

      it { is_expected.to be_falsey }
    end

    context "when value is blank" do
      let(:value) { "" }

      it { is_expected.to be_falsey }
    end

    context "when value is number zero" do
      let(:value) { 0 }

      it { is_expected.to be_falsey }
    end

    context "when value is string zero" do
      let(:value) { "0" }

      it { is_expected.to be_falsey }
    end

    context "when value is string 'false'" do
      let(:value) { "false" }

      it { is_expected.to be_falsey }
    end

    context "when value is string 'true'" do
      let(:value) { "true" }

      it { is_expected.to be_truthy }
    end

    context "when value is a number non-zero" do
      let(:value) { rand(1..999) }

      it { is_expected.to be_truthy }
    end

    context "when value is boolean true" do
      let(:value) { true }

      it { is_expected.to be_truthy }
    end

    context "when value is boolean false" do
      let(:value) { false }

      it { is_expected.to be_falsey }
    end
  end

  describe "#falsey?" do
    subject { described_class.new(value).falsey? }

    context "when value is nil" do
      let(:value) { nil }

      it { is_expected.to be_truthy }
    end

    context "when value is string true" do
      let(:value) { "true" }

      it { is_expected.to be_falsey }
    end
  end
end
