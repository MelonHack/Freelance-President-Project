extends Node2D

signal bill_notif
signal bill_notif_clear
signal next_bill
var dCounter = 0;
var shouldShow = false
var shouldNotif = false


# --- Player / Country stats ---
var stats = {
	"environment": 0,
	"industry": 0,
	"youth": 0,
	"approval": 0,
	"budget": 0,
	"debt": 0,
	"security": 0,
	"terror_risk": 0.0, # 0 to 1 (0%–100%)
}

@onready var stats_ui = $"../UI_buttons/ui_stats"
@onready var stats_advancement = $"../UI_buttons/ui_advancement"
@onready var stats_pause = $"../UI_buttons/ui_pause"

var total_bills = 8
@onready var advancement_ui = $"../UI_buttons/ui_advancement"

@onready var pause_menu = $"../UI_buttons/ui_pause"
var game_paused = false

func _ready() -> void:
	pass
	apply_stat_change({"youth":0})
	update_advancement_ui()

func _physics_process(delta: float) -> void:
	if (shouldNotif):
		emit_signal("bill_notif")
		
	if (dCounter >= 8):
		$"../UI_buttons/ui_end".visible = true
	
	update_advancement_ui()
	#checks which bill ui to open
	if (shouldShow):
		if (dCounter == 0):
			$"../UI_Bills/ui_bill1".visible = true
			shouldShow = false
			emit_signal("bill_notif_clear")
			shouldNotif = false
		elif (dCounter == 1):
			$"../UI_Bills/ui_bill2".visible = true
			shouldShow = false
			emit_signal("bill_notif_clear")
			shouldNotif = false
		elif (dCounter == 2):
			$"../UI_Bills/ui_bill3".visible = true
			shouldShow = false
			emit_signal("bill_notif_clear")
			shouldNotif = false
		elif (dCounter == 3):
			$"../UI_Bills/ui_bill4".visible = true
			shouldShow = false
			emit_signal("bill_notif_clear")
			shouldNotif = false
		elif (dCounter == 4):
			$"../UI_Bills/ui_bill5".visible = true
			shouldShow = false
			emit_signal("bill_notif_clear")
			shouldNotif = false
		elif (dCounter == 5):
			$"../UI_Bills/ui_bill6".visible = true
			shouldShow = false
			emit_signal("bill_notif_clear")
			shouldNotif = false
		elif (dCounter == 6):
			$"../UI_Bills/ui_bill7".visible = true
			shouldShow = false
			emit_signal("bill_notif_clear")
			shouldNotif = false
		elif (dCounter == 7):
			$"../UI_Bills/ui_bill8".visible = true
			shouldShow = false
			emit_signal("bill_notif_clear")
			shouldNotif = false
	
	#temporary debug for showing bill ui's
	if Input.is_action_just_pressed("debug"):
		pass


func _on_button_stats_clicked() -> void:
	stats_ui.visible = !stats_ui.visible
func _on_button_advancement_clicked() -> void:
	stats_advancement.visible = !stats_advancement.visible
func _on_button_pause_clicked() -> void:
	stats_pause.visible = !stats_pause.visible
	if game_paused:
		_resume_game()
	else:
		_pause_game()

func _on_button_bills_clicked() -> void:
	shouldShow = true

#bill stats update
func _on_button_approve_bill_1_pressed() -> void:
	apply_stat_change({"environment":1, "industry":-1})
	$"../UI_Bills/ui_bill1".visible = false
	$"../BillTimer".start()
func _on_button_deny_bill_1_pressed() -> void:
	apply_stat_change({"environment":-1, "industry":1})
	$"../UI_Bills/ui_bill1".visible = false
	$"../BillTimer".start()

func _on_button_approve_bill_2_pressed() -> void:
	apply_stat_change({"youth":1, "approval":1, "revenue":-1, "debt":1})
	$"../UI_Bills/ui_bill2".visible = false
	$"../BillTimer".start()
func _on_button_deny_bill_2_pressed() -> void:
	apply_stat_change({"youth":-1})
	$"../UI_Bills/ui_bill2".visible = false
	$"../BillTimer".start()

func _on_button_approve_bill_3_pressed() -> void:
	apply_stat_change({"approval":1, "budget":-1, "industry":-2})
	$"../UI_Bills/ui_bill3".visible = false
	$"../BillTimer".start()
func _on_button_deny_bill_3_pressed() -> void:
	apply_stat_change({"approval":-1, "budget":1})
	$"../UI_Bills/ui_bill3".visible = false
	$"../BillTimer".start()

func _on_button_approve_bill_4_pressed() -> void:
	apply_stat_change({"security":1, "approval":-2, "industry":1})
	$"../UI_Bills/ui_bill4".visible = false
	$"../BillTimer".start()
func _on_button_deny_bill_4_pressed() -> void:
	apply_stat_change({"security":-1, "terrorRisk":0.2})
	$"../UI_Bills/ui_bill4".visible = false
	$"../BillTimer".start()

func _on_button_approve_bill_5_pressed() -> void:
	apply_stat_change({"approval":1, "debt":1, "industry":-1})
	$"../UI_Bills/ui_bill5".visible = false
	$"../BillTimer".start()
func _on_button_deny_bill_5_pressed() -> void:
	apply_stat_change({"budget":1, "approval":-2})
	$"../UI_Bills/ui_bill5".visible = false
	$"../BillTimer".start()

func _on_button_approve_bill_6_pressed() -> void:
	apply_stat_change({"terrorRisk":0.05, "approval":-1})
	$"../UI_Bills/ui_bill6".visible = false
	$"../BillTimer".start()
func _on_button_deny_bill_6_pressed() -> void:
	apply_stat_change({"terrorRisk":0.3, "approval":1})
	$"../UI_Bills/ui_bill6".visible = false
	$"../BillTimer".start()

func _on_button_approve_bill_7_pressed() -> void:
	apply_stat_change({"debt":2, "approval":-1, "revenue":-2})
	$"../UI_Bills/ui_bill7".visible = false
	$"../BillTimer".start()
func _on_button_deny_bill_7_pressed() -> void:
	apply_stat_change({"security":-2, "approval":1, "terrorRisk":0.75})
	$"../UI_Bills/ui_bill7".visible = false
	$"../BillTimer".start()

func _on_button_approve_bill_8_pressed() -> void:
	apply_stat_change({"security":2, "industry":1, "debt":1, "torrorRisk":0.8})
	$"../UI_Bills/ui_bill8".visible = false
	$"../BillTimer".start()
func _on_button_deny_bill_8_pressed() -> void:
	apply_stat_change({"security":-2, "terrorRisk":0.8})
	$"../UI_Bills/ui_bill8".visible = false
	$"../BillTimer".start()

#functions updating stats
func update_stats_ui():
	if stats_ui:
		stats_ui.update_display(stats)

func apply_stat_change(changes: Dictionary):
	for key in changes.keys():
		if stats.has(key):
			stats[key] += changes[key]
			print("%s changed by %+d" % [key, changes[key]])
		else:
			push_warning("Unknown stat: %s" % key)
			
	update_stats_ui()

#advancemtn ui
func update_advancement_ui():
	if advancement_ui:
		advancement_ui.update_display(dCounter, total_bills)

#pause
func _pause_game():
	game_paused = true
	#get_tree().paused = true
	pause_menu.visible = true
	print("Game paused")

func _resume_game():
	game_paused = false
	#get_tree().paused = false
	pause_menu.visible = false
	print("Game resumed")

func _start_new_game():
	print("Starting new game...")
	get_tree().paused = false

	# Reset stats
	for key in stats.keys():
		stats[key] = 0

	# Reset bills
	dCounter = 0

	# Hide UIs
	pause_menu.visible = false
	$"../UI_buttons/ui_stats".visible = false
	$"../UI_buttons/ui_advancement".visible = false
	$"../UI_buttons/ui_end".visible = false
	# Show first bill again

	# Update UIs
	update_stats_ui()
	update_advancement_ui()

	game_paused = false


func _on_bill_timer_timeout() -> void:
	shouldNotif = true
	dCounter += 1
