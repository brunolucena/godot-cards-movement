extends Camera2D

var step = 10
var threshold = 50
var mouse_position_in_viewport: Vector2


func _process(_delta):
	move_camera_when_mouse_is_close_to_viewport_boundaries()


# zoom is not working
#func _input(event: InputEvent) -> void:
#	if event is InputEventMouseButton:
#		if event.is_pressed():
#			if event.button_index == BUTTON_WHEEL_UP:
#				zoom -= Vector2(0.1, 0.1)
#			elif event.button_index == BUTTON_WHEEL_DOWN:
#				zoom += Vector2(0.1, 0.1)


func move_camera_when_mouse_is_close_to_viewport_boundaries():
	var viewport_mouse_position = mouse_position_in_viewport

	var viewport_x_origin = 320
	var viewport_x_end = 1280
	var viewport_y_end = 720

	var is_mouse_pos_out_of_viewport_boundaries = (
			viewport_mouse_position.x < viewport_x_origin
			or viewport_mouse_position.x > viewport_x_end
			or viewport_mouse_position.y < 0
			or viewport_mouse_position.y > viewport_y_end
	)
	if is_mouse_pos_out_of_viewport_boundaries:
		return

#	print({
#		"viewport_mouse_position.x": viewport_mouse_position.x,
#		"viewport_mouse_position.x2": to_global(viewport_mouse_position).x,
#	})

	var is_mouse_position_at_left_threshold = viewport_mouse_position.x < threshold + viewport_x_origin
	var is_mouse_position_at_right_threshold = viewport_mouse_position.x > viewport_x_end - threshold
	var is_mouse_position_at_top_threshold = viewport_mouse_position.y < threshold
	var is_mouse_position_at_bottom_threshold = viewport_mouse_position.y > viewport_y_end - threshold

	var min_position_left = limit_left + 50
	var max_position_right = limit_right - viewport_x_end - 50
	var min_position_top = limit_top + 50
	var max_position_bottom = limit_bottom - viewport_y_end - 50

	if is_mouse_position_at_left_threshold:
		if position.x >= min_position_left:
			position.x -= step
	elif is_mouse_position_at_right_threshold:
		if position.x <= max_position_right:
			position.x += step

	if is_mouse_position_at_top_threshold:
		if position.y >= min_position_top:
			position.y -= step
	elif is_mouse_position_at_bottom_threshold:
		if position.y <= max_position_bottom:
			position.y += step
