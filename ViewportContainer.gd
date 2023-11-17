extends ViewportContainer


func _process(delta: float) -> void:
	$Viewport/Cards.mouse_position_in_viewport = get_viewport().get_mouse_position()
