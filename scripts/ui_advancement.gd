extends Control

func update_display(bills_done: int, total_bills: int):
	$Label.text = "Bills Completed: %d / %d" % [bills_done, total_bills]
	if has_node("ProgressBar"):
		$ProgressBar.value = float(bills_done) / float(total_bills) * 100.0
