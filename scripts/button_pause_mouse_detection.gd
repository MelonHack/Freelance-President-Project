extends Area2D

@onready var animationPlayer = $"../sprite_button_pause"
signal area_clicked
# Called when the node enters the scene tree
func _ready():
	# Connect signals for mouse enter/exit
	connect("mouse_entered", Callable(self, "_on_mouse_entered"))
	connect("mouse_exited", Callable(self, "_on_mouse_exited"))

# Signal callback when mouse enters the area
func _on_mouse_entered():
	animationPlayer.play("hovered")

# Signal callback when mouse exits the area
func _on_mouse_exited():
	animationPlayer.play("default")

# Mouse click signal
func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		emit_signal("area_clicked")
