extends Node2D


var mouse_position_in_viewport: Vector2 setget set_mouse_position_in_viewport


func set_mouse_position_in_viewport(position: Vector2):
	mouse_position_in_viewport = position
	$Camera2D.mouse_position_in_viewport = position

