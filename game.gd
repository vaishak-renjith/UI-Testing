extends SubViewportContainer
@export var time:float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$SubViewport/Timer.wait_time = time
	$SubViewport/Timer.one_shot = true
	$SubViewport/Timer.start()

func _on_timer_timeout() -> void:
	get_tree().quit()
