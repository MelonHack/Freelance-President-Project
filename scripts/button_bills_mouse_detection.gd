extends Area2D

@onready var animationPlayer = $"../AnimatedSprite2D"
signal area_clicked
# Called when the node enters the scene tree
func _ready():
	input_pickable = false

# Mouse click signal
func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		emit_signal("area_clicked")

func _on_bill_notif() -> void:
	$"..".visible = true
	animationPlayer.play("notif")
	input_pickable = true

func _on_notif_clear() -> void:
	input_pickable = false
	$"..".visible = false
