class
	CELL_GRID

create
	make

feature {NONE} -- Initialization

<<<<<<< HEAD
	make(dimensions:INTEGER)
=======
	make (dims: INTEGER)
>>>>>>> 3e7cf6af93e1a376743ded21e5f8f9b6a87357ca
			-- Initialization for `Current'.
		require
			dimensions > 0
		do
<<<<<<< HEAD
			dim := dimensions
=======
			dim := dims
>>>>>>> 3e7cf6af93e1a376743ded21e5f8f9b6a87357ca
			create current_grid.make_filled (False, dim, dim)
		ensure
			dim = dimensions
			current_grid /= void
		end

feature --Access

	dim: INTEGER
			-- Grid dimension.

	cell_at (i, j: INTEGER): BOOLEAN
			-- Value of cell at (i , j)
		require
			i >= 1 and j >= 1
			i <= dim and j <=dim
		do
<<<<<<< HEAD
			Result := current_grid[i,j]
		ensure
			Result=current_grid[i,j]
=======
			Result := current_grid[i, j]
>>>>>>> 3e7cf6af93e1a376743ded21e5f8f9b6a87357ca
		end

feature -- Status Setting

	set_cell_status (b: BOOLEAN; i, j: INTEGER)
			-- Set status of cell at (i , j)
		require
			i >= 1 and j >= 1
			i <= dim and j <=dim
		do
			current_grid[i,j] := b
		ensure
			current_grid[i,j] = b
		end

feature -- Basic operations

	compute_next_generation
			--Compute next generation of cells.

		local
			i,j:INTEGER
			living_neighbors:INTEGER
		do
			from
				i:=1
			until
				i = current_grid.height
			loop
				from
					j:=1
				until
					j = current_grid.width
				loop
					if current_grid[i-1,j-1] then living_neighbors := living_neighbors + 1 end
					if current_grid[i-1,j] then living_neighbors := living_neighbors + 1 end
					if current_grid[i-1,j+1] then living_neighbors := living_neighbors + 1 end
					if current_grid[i,j-1] then living_neighbors := living_neighbors + 1 end
					if current_grid[i,j+1] then living_neighbors := living_neighbors + 1 end
					if current_grid[i+1,j-1] then living_neighbors := living_neighbors + 1 end
					if current_grid[i+1,j] then living_neighbors := living_neighbors + 1 end
					if current_grid[i+1,j+1] then living_neighbors := living_neighbors + 1 end
					set_cell_status (new_state_of_cell(i,j, living_neighbors),i,j)
				end
			end

		end

feature {NONE} -- Implementation

	current_grid: ARRAY2 [BOOLEAN]
			-- Grid representation as a matrix of boolean cells (”True” means alive for a cell )

	new_state_of_cell (i, j, living_neighbors: INTEGER): BOOLEAN
			-- Apply Conway's Game of Life rules to compute new state for cell at (i,j) given a number of `living neighbors'
		require
			i >= 1 and j >= 1
			i <= dim and j <=dim
			living_neighbors >= 0 and living_neighbors <=8
		do
			if living_neighbors = 3 then
				Result := true
			elseif current_grid[i,j] and living_neighbors = 2 then
				Result := true
			end
		end

end

