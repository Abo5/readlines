require_relative '../lib/readlines'
require 'fileutils'


RSpec.describe Readlines::ReadDuc do
  let(:file_path) { 'spec/test_file.txt' }
  let(:read_duc) { described_class.new(file_path) }

  before do
    File.write(file_path, <<~TEXT)
      Hello, this is a test file.
      Line with special characters: @$#%!
      1234567890
      Another line with text.
      CSV line, 1,2,3,4,5
      CSV line, 10,20,30,40,50
      CSV line, 100,200,300,400,500
      Line with repeated words: test test test
      End of the file.
    TEXT
  end

  after do
    File.delete(file_path) if File.exist?(file_path)
  end

  describe '#line_count' do
    it 'returns the number of lines in the file' do
      expect(read_duc.line_count_now).to eq(9)
    end
  end

  describe '#word_count' do
    it 'returns the number of words in the file' do
      expect(read_duc.word_count_now).to eq(36)
    end
  end

  describe '#read_lines' do
    it 'reads all lines from the file' do
      expect(read_duc.read_lines_now).to eq(File.read(file_path))
    end
  end

  describe '#replace' do
    it 'replaces a pattern with the given replacement' do
      read_duc.replace_now('Line', 'Sentence')
      expect(File.read(file_path)).to include('Sentence with special characters')
    end
  end

  describe '#delete_empty_lines' do
    it 'deletes all empty lines from the file' do
      read_duc.delete_empty_lines_now
      expect(File.read(file_path).include?("\n\n")).to be false
    end
  end

  describe '#delete_unwanted_characters' do
    it 'deletes specific unwanted characters from the file' do
      read_duc.delete_unwanted_characters_now('@$#%!')
      expect(File.read(file_path)).to eq("Hello, this is a test file.\nLine with special characters: \n1234567890\nAnother line with text.\nCSV line, 1,2,3,4,5\nCSV line, 10,20,30,40,50\nCSV line, 100,200,300,400,500\nLine with repeated words: test test test\nEnd of the file.\n")
    end
  end

  describe '#delete_lines' do
    it 'deletes specific lines from the file' do
      read_duc.delete_lines_now([2, 4])
      expect(File.read(file_path)).not_to include("Line with special characters: @$#%!")
      expect(File.read(file_path)).not_to include("Another line with text.")
    end
  end

  describe '#delete_duplicate_lines' do
    it 'deletes duplicate lines from the file' do
      File.write(file_path, "Hello\nWorld\nHello\n")
      read_duc.delete_duplicate_lines_now
      expect(File.read(file_path)).to eq("Hello\nWorld\n")
    end
  end

  describe '#sort_alphabetically' do
    it 'sorts the lines alphabetically' do
      File.write(file_path, "Banana\nApple\nCherry\n")
      read_duc.sort_alphabetically_now
      expect(File.read(file_path)).to eq("Apple\nBanana\nCherry\n")
    end
  end

  describe '#convert_to_array' do
    it 'converts the file to an array of lines' do
      expect(read_duc.convert_to_array_now).to eq([
        "Hello, this is a test file.",
        "Line with special characters: @$#%!",
        "1234567890",
        "Another line with text.",
        "CSV line, 1,2,3,4,5",
        "CSV line, 10,20,30,40,50",
        "CSV line, 100,200,300,400,500",
        "Line with repeated words: test test test",
        "End of the file."
      ])
    end
  end

  describe '#filter' do
    context 'with :start and :replace operation' do
      it 'replaces lines that start with a specific value' do
        read_duc.filter("Hello", :start, :replace, "Hi")
        expect(File.read(file_path)).to include("Hi, this is a test file.")
      end
    end

    context 'with :body and :replace operation' do
      it 'replaces lines containing a specific value' do
        read_duc.filter("special", :body, :replace, "unique")
        expect(File.read(file_path)).to include("Line with unique characters: @$#%!")
      end
    end

    context 'with :end and :replace operation' do
      it 'replaces lines that end with a specific value' do
        read_duc.filter("file.", :end, :replace, "document.")
        expect(File.read(file_path)).to include("End of the document.")
      end
    end

    context 'with :start and :delete operation' do
      it 'deletes lines that start with a specific value' do
        read_duc.filter("Hello", :start, :delete)
        expect(File.read(file_path)).not_to include("Hello, this is a test file.")
      end
    end

    context 'with :body and :delete operation' do
      it 'deletes lines that contain a specific value' do
        read_duc.filter("special", :body, :delete)
        expect(File.read(file_path)).not_to include("Line with special characters: @$#%!")
      end
    end

    context 'with :end and :delete operation' do
      it 'deletes lines that end with a specific value' do
        read_duc.filter("file.", :end, :delete)
        expect(File.read(file_path)).not_to include("End of the file.")
      end
    end
  end
end
