return {
	{
		"hud.lua",
		{"widgets", 5, "children"},
		{
			name = [[greenscreen]],
			isVisible = false,
			noInput = false,
			anchor = 1,
			rotation = 0,
			x = 86,
			xpx = true,
			y = 84,
			ypx = true,
			w = 168,
			wpx = true,
			h = 168,
			hpx = true,
			sx = 1,
			sy = 1,
			skin_properties =
			{
				size =
				{
					default =
					{
						w = 168,
						wpx = true,
						h = 168,
						hpx = true,
					},
					Small =
					{
						w = 136,
						wpx = true,
						h = 136,
						hpx = true,
					},
				},
			},
			ctor = [[image]],
			color =
			{
				1,
				1,
				1,
				1,
			},
			images =
			{
				{
					file = [[white.png]],
					name = [[]],
					color =
					{
						1,
						1,
						1,
						1,
					},
				},
			},
		},
		6
	},
}
