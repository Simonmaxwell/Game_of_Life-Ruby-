
def generate_grid(size_x,size_y)
  (0...size_y).map do |y|
    (0...size_x).map do |x|
      Random.rand(2)
    end
  end
end

class GridAlgorithm

  def initialize(storage)
    @size_y = storage.length
    @size_x = storage[0].length
    @storage = storage
  end

  def census_value_at(x,y)
    return 0 if y < 0 || y >= @size_y || x < 0 || x >= @size_x
    @storage[y][x]
  end

  def count_neighbors(x,y)
    census_total = 0
    (y-1..y+1).each do |ny|
      (x-1..x+1).each do |nx|
        census_total += census_value_at(nx,ny)
      end
    end
    census_total - census_value_at(x,y)
  end

  def alive_or_not(x,y)
    if @storage[y][x] == 1
      count_neighbors(x,y) >= 2 && count_neighbors(x,y) <= 3
    else
      count_neighbors(x,y) == 3
    end

  end

  def life_goes_on
    (0...@size_y).map do |y|
      (0...@size_x).map do |x|
          alive_or_not(x,y)
        end
      end
  end

end

def report(cell_grid)
  cell_grid.each do |row|
    row.each do |cell|
      print (cell == 1) ? 'ʘ ' : '. '
    end
    puts
  end
end

def passage_of_time
  grid = generate_grid(15,15)
  biome = GridAlgorithm.new(grid)
  next_generation = biome.life_goes_on
  report(next_generation)

end

passage_of_time

