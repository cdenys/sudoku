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
    @grid.map.with_index do |row, index|
      floored_row_index = (index / 3).floor

      region_rows = floored_row_index * 3

      board_rows = @grid[region_rows..region_rows + 2]

      normalized_col = index % 3

      representative_col = normalized_col * 3

      board_cells = board_rows.map do |row_x|
        row_x[representative_col..representative_col + 2]
      end

      board_cells.flatten
    end
  end

  def self.done_or_not(grid)
    sudoku = Sudoku.new(grid)

    sudoku.rows.each do |row|
      return 'Try again!' unless row.valid?
    end

    sudoku.columns.each do |column|
      return 'Try again!' unless column.valid?
    end

    sudoku.regions.each do |region|
      return 'Try again!' unless region.valid?
    end

    'Finished!'
  end
end

class Array
  require 'set'

  def valid?
    self == Set.new(self).to_a
  end
end