class
	CELL_GRID

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization for `Current'.
		do
			create current_grid.make_filled (False, dim, dim)
		end

feature --Access

	dim: INTEGER
			-- Grid dimension.

	cell_at (i, j: INTEGER): BOOLEAN
			-- Value of cell at (i , j)
		do
		end

feature -- Status Setting

	set_cell_status (b: BOOLEAN; i, j: INTEGER)
			-- Set status of cell at (i , j)
		do
			current_grid[i,j] := b
		end

feature -- Basic operations

	compute_next_generation
			--Compute next generation of cells.
		local
			i,j:INTEGER
		do

		end

feature {NONE} -- Implementation

	current_grid: ARRAY2 [BOOLEAN]
			-- Grid representation as a matrix of boolean cells (”True” means alive for a cell )

	new_state_of_cell (i, j, living_neighbors: INTEGER): BOOLEAN
			-- Apply Conway's Game of Life rules to compute new state for cell at (i,j) given a number of `living neighbors'
		do

		end

end

