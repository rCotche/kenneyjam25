extends Label

@export var animated_font_size: int = 12:
	set(value):
		animated_font_size = value
		add_theme_font_size_override("font_size", value)
