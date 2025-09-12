describe ToHash do
  describe "#call" do
    subject(:converted_hash) { described_class.call(content, fallback) }

    let(:fallback) { {} }

    context "when the content is a hash" do
      let(:content) { {"string_key" => "string_value", :symbol_key => "symbol_value"} }

      it { expect(converted_hash[:string_key]).to eq("string_value") }
      it { expect(converted_hash["string_key"]).to eq("string_value") }
      it { expect(converted_hash[:symbol_key]).to eq("symbol_value") }
      it { expect(converted_hash["symbol_key"]).to eq("symbol_value") }
    end

    context "when the content is a valid JSON string" do
      let(:content) { '{"string_key": "string_value", "symbol_key": "symbol_value"}' }

      it { expect(converted_hash[:string_key]).to eq("string_value") }
      it { expect(converted_hash["string_key"]).to eq("string_value") }
      it { expect(converted_hash[:symbol_key]).to eq("symbol_value") }
      it { expect(converted_hash["symbol_key"]).to eq("symbol_value") }
    end

    context "when the content is invalid" do
      let(:content) { "invalid json" }

      it { expect(converted_hash).to eq(fallback) }
    end

    context "when the content is nil" do
      let(:content) { nil }

      it { expect(converted_hash).to eq(fallback) }
    end

    context "when the content is blank" do
      let(:content) { "" }

      it { expect(converted_hash).to eq(fallback) }
    end
  end
end
