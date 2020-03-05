require 'set'

class Sudoku

  def self.done_or_not(grid)
    grid = Sudoku.new(grid)
    if grid.rows.all?(&:valid?) && grid.columns.all?(&:valid?) &&
        grid.regions.all?(&:valid?)
      'Finished!'
    else
      'Try again!'
    end
  end

  def initialize(input)
    @grid = input
  end

  def rows
    @grid
  end

  def columns
    rows.transpose
  end

  def regions
    flat_triplet_list = rows.flatten.each_slice(3).to_a
    [].tap do |result|
      9.times do |i|
        region = []
        [0, 3, 6].each do |j|
          region << flat_triplet_list[i + j]
        end
        result << region.flatten
        i *= 9
      end
    end
  end
end

class Array
  def valid?
    # flatten.each_with_object(Hash.new(0)) do |digit, acc|
    #   acc[digit] += 1
    #   return false if acc[digit] > 1
    # end.all? { |_, v| v == 1 }
    Set[*self].size == 9
  end
end