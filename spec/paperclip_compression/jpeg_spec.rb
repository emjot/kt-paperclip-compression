# frozen_string_literal: true

RSpec.describe PaperclipCompression::Jpeg do
  let(:file) do
    path = File.join(PaperclipCompression.root, 'spec', 'support', 'test.jpg')
    File.new(path, 'rb')
  end

  after do
    file.close
  end

  it 'processes the file via embedded binary' do
    result = described_class.new(file, false, whiny: true).make

    expect(File.size(result.path)).to be > 0
    expect(File.size(result.path)).to be <= File.size(file.path)
  end

  it 'does not process if command exists but config.process_file? is false' do
    allow(PaperclipCompression::Config).to receive(:create_with_fallbacks).and_return(
      instance_double(PaperclipCompression::Config, process_file?: false, command: 'command')
    )

    allow(Paperclip).to receive(:run)
    described_class.new(file, false).make

    expect(Paperclip).not_to have_received(:run)
  end

  it 'uses config command and options' do
    options = {
      PaperclipCompression::Config::PROCESSOR_OPTIONS_KEY => {
        PaperclipCompression::Config::KEY => {
          PaperclipCompression::Jpeg::KEY => {
            command: 'abc',
            options: 'xyz'
          }
        }
      }
    }

    allow(Paperclip).to receive(:run)
    described_class.new(file, false, options).make

    expect(Paperclip).to have_received(:run).with('abc', 'xyz :src_path > :dst_path', anything)
  end
end
