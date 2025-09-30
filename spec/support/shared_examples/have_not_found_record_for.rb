shared_examples "have not found record for" do |model, gender|
  let(:not_found_message) do
    t("components.alerts.not_found.#{gender}", model: h.tm(model)).capitalize
  end

  it { expect(page).to have_content(not_found_message) }
end
