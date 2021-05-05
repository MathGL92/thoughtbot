require 'spec_helper'

RSpec.describe RecipientsSplitter do
  describe '#call' do
    subject { described_class.new(recipients).call }

    context 'when recipients have semi-colons' do
      let(:recipients) { 'one@example.com;two@example.com' }

      it 'splits email addresses' do
        expect(subject).to eq(['one@example.com', 'two@example.com'])
      end
    end

    context 'when recipients have comas' do
      let(:recipients) { 'one@example.com,two@example.com' }

      it 'splits email addresses' do
        expect(subject).to eq(['one@example.com', 'two@example.com'])
      end
    end

    context 'when recipients have new lines' do
      let(:recipients) { "one@example.com\ntwo@example.com" }

      it 'splits email addresses' do
        expect(subject).to eq(['one@example.com', 'two@example.com'])
      end
    end

    context 'when recipients have spaces' do
      let(:recipients) { '  one@example.com,two@example.com     ' }

      it 'strips spaces' do
        expect(subject).to eq(['one@example.com', 'two@example.com'])
      end
    end
  end
end
