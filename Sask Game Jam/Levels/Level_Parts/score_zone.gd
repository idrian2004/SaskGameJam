extends Node2D

@onready var global = get_node("/root/Global")

func _on_area_2d_body_entered(body):
	if body.is_in_group("player") and global.score > 60:
		global.banked_score += global.score - 60
		global.timer_reset()
		print(global.banked_score)
