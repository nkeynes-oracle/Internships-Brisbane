require_relative '../lib/internship_digest'
require 'rspec'

files = Dir.glob(
    File.join(
        __dir__, '..', '..', '_Internships', '*.md'
    )
)

files.each do |filename|
  describe filename[/\w+(.md)/] do
    before(:all) do
      @file = File.open(filename)
    end

    after(:each) do
      @file.rewind
    end

    describe 'Requirements' do
      it 'Should start with a title' do
        line = @file.readline[/(# ).+/]
        expect(line.nil?) == false
      end

      it 'Should contain a preamble section' do
        contains = false
        @file.each_line do |line|
          contains = true if(line.downcase[/(## preamble)/])
        end
        fail('No preamble section! File should include: # Preamble') unless contains
      end

      describe 'Preamble' do
        before(:all) do
          @preamble = 0
          count = 0
          @file.each_line do |line|
            count += 1
            if(line.downcase[/(## preamble)/])
              @preamble = count
              break
            end
          end
        end

        before(:each) do
          @file.rewind
        end

        it 'Should contain tag: @company' do
          contains = false
          @preamble.times { @file.readline }
          line = 'An Example String'

          until @file.eof? || line.strip.empty? do
            line = @file.readline
            contains = true if(line.downcase[/(@company)/])
          end
          fail('No company tag!') unless contains
        end

        it 'Should contain tag: @location' do
          contains = false
          @preamble.times { @file.readline }
          line = 'An Example String'

          until @file.eof? || line.strip.empty? do
            line = @file.readline
            contains = true if(line.downcase[/(@location)/])
          end
          fail('No location tag!') unless contains
        end

        it 'Should contain tag: @commence' do
          contains = false
          @preamble.times { @file.readline }
          line = 'An Example String'

          until @file.eof? || line.strip.empty? do
            line = @file.readline
            contains = true if(line.downcase[/(@commence)/])
          end
          fail('No commence tag!') unless contains
        end

        it 'Should contain tag: @applicationDue' do
          contains = false
          @preamble.times { @file.readline }
          line = 'An Example String'

          until @file.eof? || line.strip.empty? do
            line = @file.readline
            puts line
            contains = true if(line.downcase[/(@applicationdue)/])
          end
          fail('No applicationDue tag!') unless contains
        end

        it 'Should contain tag: @link' do
          contains = false
          @preamble.times { @file.readline }
          line = 'An Example String'

          until @file.eof? || line.strip.empty? do
            line = @file.readline
            contains = true if(line.downcase[/(@link)/])
          end
          fail('No link tag!') unless contains
        end
      end

      it 'Should include a description' do
        contains = false
        @file.each_line do |line|
          contains = true if(line.downcase[/(## description)/])
        end
        fail('No description section!') unless contains
      end
    end
  end
end
