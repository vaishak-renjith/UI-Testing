extends Sprite2D
@export var click_text : Label
@export var clicks_required : int
@export var glassCrack1 : Sprite2D
@export var glassCrack2 : Sprite2D
@export var glassIntact : Sprite2D
@export var glassCrackFully : Sprite2D

var counter = 0
var system_font = SystemFont.new()
var font_size = 40

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# initialize font 
	click_text.text = str(counter)
	click_text.add_theme_font_size_override("font_size", font_size)
	click_text.add_theme_font_override("font", system_font)
	print(clicks_required)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if counter < clicks_required:
			counter+=1
		
		click_text.text = str(counter) # update score
		
		# update font size
		font_size += 4
		var current_font = click_text.get_theme_font("font")
		click_text.add_theme_font_size_override("font_size", font_size)
		click_text.add_theme_font_override("font", system_font)
		
		scale = Vector2(1.05 * 0.39, 1.05 * 0.364)
		click_text.scale = Vector2(1, 1)
		
		if counter == clicks_required:
			print("minigame won")
			await get_tree().create_timer(0.1).timeout
			visible = false
			get_tree().quit()
	else:
		scale = Vector2(0.39, 0.364)
