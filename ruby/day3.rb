# Tyler Palsulich
# Seven Languages in Seven Weeks, by Bruce A. Tate
# Ruby Day 3

# Modify the CSV application to support an each method to return a
# CsvRow object. Use method_missing on that CsvRow to return the value
# for the column for a given heading.

module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end
  
  module InstanceMethods
    attr_accessor :headers, :csv_contents
    
    def initialize
      read
    end
    
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      
      @headers = file.gets.chomp.split(', ')
            
      file.each do |row|
        @csv_contents << CsvRow.new(@headers, row.chomp.split(', '))
      end
    end
    
    def each
      @csv_contents.each {|row| yield row}
    end
        
    class CsvRow
      def initialize(headers, row)
        @headers = headers
        @row = row
      end
      
      def method_missing name, *args, &block
        @row[@headers.index(name.to_s)]
      end
    end

  end
end

class TextFile  # no inheritance! You can mix it in
  include ActsAsCsv
  acts_as_csv
end

m = TextFile.new
m.each {|row| puts row.status if row.key == 'test'}