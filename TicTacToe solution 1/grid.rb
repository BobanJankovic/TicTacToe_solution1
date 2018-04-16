class Grid
    attr_accessor :array
    def initialize
      @array = []
      prepare_grid
    end
  
    def prepare_grid
      i = 3
     while i > 0 do
          @array << Array.new(3, "*")
          i -= 1
        end
      end
  
    def pretty_print
      @array.each_with_index do |row, i|
        row.each_with_index do |col, j|
          print "#{@array[i][j]} | "
        end
        print "\n"
        puts "____________"
      end
    end
   end