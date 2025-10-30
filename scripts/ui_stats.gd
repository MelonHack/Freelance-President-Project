extends Control

func update_display(stats: Dictionary):
	$label_environment.text = "Environment: %d" % stats["environment"]
	$label_industry.text = "Industry: %d" % stats["industry"]
	$label_youth.text = "Youth: %d" % stats["youth"]
	$label_approval.text = "Approval: %d" % stats["approval"]
	$label_budget.text = "Budget: %d" % stats["budget"]
	$label_debt.text = "Debt: %d" % stats["debt"]
	$label_security.text = "Security: %d" % stats["security"]
	$label_terrorRisk.text = "Terror Risk: %d%%" % int(stats["terror_risk"] * 100)
