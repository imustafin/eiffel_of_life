class
	APPLICATION

inherit

	EV_APPLICATION

create
	make_and_launch

feature {NONE}

	make_and_launch
		do
			default_create
			prepare
			launch
		end

feature {NONE}

	prepare
		local
			pixmap: EV_PIXMAP
		do
			create pixmap.make_with_size (400, 400)
			pixmap.set_background_color (create {EV_COLOR}.make_with_rgb (0.4, 0, 0))
			pixmap.set_foreground_color (create {EV_COLOR}.make_with_rgb (1, 0, 0))
			pixmap.fill_rectangle (100, 200, 30, 40)
			first_window.extend (pixmap)
			first_window.close_request_actions.extend (agent destroy)
			first_window.show
		end

	first_window: EV_TITLED_WINDOW
		once
			create Result.make_with_title ("Eiffel of Life")
		end

end
