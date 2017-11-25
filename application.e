class
	APPLICATION

inherit

	EV_APPLICATION
		redefine
			create_interface_objects
		end

create
	make_and_launch

feature {NONE}

	make_and_launch
		do
			create cell_grid.make (Dims)
			default_create
			prepare
			launch
		end

feature {NONE} -- Window and application initialization

	create_interface_objects
		-- <Precursor>
		do
			create box
			create pixmap.make_with_size (400, 400)
			create first_window.make_with_title ("Eiffel of Life")
			first_window.set_minimum_size (400, 400)
			create next_generation_button.make_with_text ("Next Generation")

			box.extend (pixmap)
			box.extend (next_generation_button)
			first_window.extend (box)
		end

	prepare
		do
			set_first_generation

			next_generation_button.select_actions.extend (agent next_generation_button_clicked)

			set_first_generation
			draw_to_pixmap

			first_window.close_request_actions.extend (agent destroy)
			first_window.show
		end

	next_generation_button_clicked
		do
			next_generation
			draw_to_pixmap
		end

	box: EV_VERTICAL_BOX
	pixmap: EV_PIXMAP
	next_generation_button: EV_BUTTON
	first_window: EV_TITLED_WINDOW

	Pixmap_dims: INTEGER = 400

feature {NONE} -- Game of Life generations

	Dims: INTEGER = 40

	cell_grid: CELL_GRID

	draw_to_pixmap
		local
			square_size: INTEGER
			i, j: INTEGER
			status: BOOLEAN
		do
			square_size := Pixmap_dims // Dims
			from
				i := 1
			until
				i > Dims
			loop
				from
					j := 1
				until
					j > Dims
				loop
					status := cell_grid.cell_at (i, j)
					if status then
						pixmap.set_foreground_color (create {EV_COLOR}.make_with_rgb (1, 1, 1))
					else
						pixmap.set_foreground_color (create {EV_COLOR}.make_with_rgb (0, 0, 0))
					end
					pixmap.fill_rectangle (square_size * (i - 1), square_size * (j - 1), square_size, square_size)
					j := j + 1
				end
				i := i + 1
			end
		end

	set_first_generation
		local
			random: RANDOM
			i, j: INTEGER
			status: BOOLEAN
		do
			create random.set_seed (123)
			from
				i := 1
			until
				i > Dims
			loop
				from
					j := 1
				until
					j > Dims
				loop
					random.forth
					status := ((random.item \\ 2) = 0)
					cell_grid.set_cell_status (status, i, j)
					j := j + 1
				end
				i := i + 1
			end

		end

	next_generation
		do
			cell_grid.compute_next_generation
		end

end
