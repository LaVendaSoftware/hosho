describe ApplicationJob do
  subject(:job) { described_class.new }

  it { expect(job).to be_a(described_class) }
end
