extends Control

@onready var newgame_button = $button_newGame
@onready var game_manager = $"../../GameManager"

func _ready():
	newgame_button.pressed.connect(_on_newgame_pressed)

func _on_resume_pressed():
	game_manager._resume_game()

func _on_newgame_pressed():
	game_manager._start_new_game()
