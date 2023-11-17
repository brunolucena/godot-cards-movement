extends Area2D
class_name CardCursor

var active_card: Area2D = null
var is_pressed = false

onready var camera := $"../Camera2D" as Camera2D


# with overlapping_areas - Much better
func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		var mouse_position = event.position
		var mouse_position_with_camera = mouse_position + camera.position

		if (
				mouse_position_with_camera.x < camera.limit_left
				or mouse_position_with_camera.x > camera.limit_right
				or mouse_position_with_camera.y < camera.limit_top
				or mouse_position_with_camera.y > camera.limit_bottom
		):
			return

		position = mouse_position_with_camera

		if is_pressed and active_card:
			active_card.position = position

	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			is_pressed = event.is_pressed()
			if is_pressed:
				var areas = get_overlapping_areas()
				for area in areas:
					if area.is_in_group("card"):
						active_card = area
			else:
				active_card = null


func _on_CardCursor_area_entered(area: Area2D) -> void:
	if area.is_in_group("card") and not active_card:
		active_card = area


func _on_CardCursor_area_exited(area: Area2D) -> void:
	if area == active_card:
		active_card = null
