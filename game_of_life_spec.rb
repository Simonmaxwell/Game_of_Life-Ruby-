require 'rspec'
require_relative 'game_of_life'

describe GridAlgorithm do
  describe 'census_value_at' do
    context 'with a partially filled four-by-four grid' do
      let(:grid) {
        [[0,1,0,0],
         [0,0,1,0],
         [1,1,1,0],
         [0,0,0,0],
        ]
      }
      let(:algorithm) { GridAlgorithm.new(grid) }

      it 'returns 0 if out-of-bounds' do
        expect(algorithm.census_value_at(-1,  0)).to eq(0)
        expect(algorithm.census_value_at(0, -1)).to eq(0)
        expect(algorithm.census_value_at(4,  0)).to eq(0)
        expect(algorithm.census_value_at(0,  4)).to eq(0)
      end

      it 'returns cell value if in-bounds' do
        grid.each_with_index do |row, y|
          row.each_with_index do |cell, x|
            expect(algorithm.census_value_at(x, y)).to eq(cell)
          end
        end
      end

    end
  end

  describe 'count_neighbors' do
    context 'with a partially filled four-by-four grid' do
      let(:grid) {
        [[0,1,0,0],
         [0,0,1,0],
         [1,1,1,0],
         [0,0,0,0],
         ]
      }
      let(:algorithm) { GridAlgorithm.new(grid) }

      it 'returns the number live neighbors' do
        expect(algorithm.count_neighbors(0,0)).to eq(1)
        expect(algorithm.count_neighbors(1,2)).to eq(3)
        expect(algorithm.count_neighbors(1,1)).to eq(5)
      end
    end
  end

  describe 'aive_or_not' do
    context 'with a partially filled four-by-six grid' do
      let(:grid) {
        [[0,1,0,0],
         [0,0,1,0],
         [1,1,1,0],
         [0,0,0,0],
         [1,1,1,1],
         [1,1,1,1],
        ]
      }
      let(:algorithm) { GridAlgorithm.new(grid) }

      it 'returns false if a dead cell does not have 3 live neighbors' do
        expect(algorithm.alive_or_not(0,0)).to eq(false)
        expect(algorithm.alive_or_not(3,3)).to eq(true)
        expect(algorithm.alive_or_not(1,1)).to eq(false)
      end

      it 'returns true if a live cell has between 2 & 3 live neighbors' do
        expect(algorithm.alive_or_not(1,0)).to eq(false)
        expect(algorithm.alive_or_not(1,5)).to eq(false)
        expect(algorithm.alive_or_not(0,1)).to eq(true)
        expect(algorithm.alive_or_not(2,2)).to eq(true)
      end
    end
  end

end