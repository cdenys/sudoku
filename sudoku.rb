class Sudoku

  def initialize(grid)
    @grid = grid
  end

  def rows
    @grid
  end

  def columns
    @grid.transpose
  end

  def regions
    # I used .map https://www.rubyguides.com/2018/10/ruby-map-method/
    # parse every rows of sudoku
    @grid.map.with_index do |row, index|
      # index 0 to 8 => 0, 0, 0, 1, 1, 1, 2, 2, 2
      floored_row_index = (index / 3).floor

      # index 0 to 8 => 0, 0, 0, 3, 3, 3, 6, 6, 6
      region_index_starter = floored_row_index * 3

      # 3 rows by 3
      # index 0 to 2 => @grid[0..2]
      # => [[row one], [row two], [row three]]
      # index 3 to 5 => @grid[3..5]
      # => [[row four], [row five], [row six]]
      # index 6 to 8 => @grid[6..9]
      # => [[row seven], [row eight], [row nine]]
      array_of_three_rows = @grid[region_index_starter..region_index_starter + 2]

      # modulo 3 => [0, 1, 2, 0, 1, 2, 0, 1, 2]
      column_by_region = index % 3

      # => [0, 3, 6, 0, 3, 6, 0, 3, 6]
      region_index_by_column = column_by_region * 3

      board_regions = array_of_three_rows.map do |row|
        row[region_index_by_column..region_index_by_column + 2]
      end

      # inspect returns a string containing
      # a human-readable representation of obj
      # puts board_regions.flatten.inspect

      board_regions.flatten
    end
  end

  def self.done_or_not(grid)
    # new instance of Sudoku with grid in parameter
    sudoku = Sudoku.new(grid)

    sudoku.rows.each do |row|
      # 'unless' is like 'if !row.valid?'
      return 'Try again!' unless row.valid?
    end

    sudoku.columns.each do |column|
      return 'Try again!' unless column.valid?
    end

    sudoku.regions.each do |region|
      return 'Try again!' unless region.valid?
    end

    # if every rows/columns/regions is valid we return 'Finished!'
    'Finished!'
  end
end

# monkey patch Array from Ruby
# we added valid? method
# ? at the end of method name because it returns a boolean
class Array
  # we needed to use Set.new
  require 'set'

  def valid?
    # self return an array because we are in Array class
    # in the tests it returns the value of
    # Sudoku.new(grid).rows[3]
    # or Sudoku.new(grid).columns[3]
    # or Sudoku.new(grid).regions[2]
    self == Set.new(self).to_a
  end
end