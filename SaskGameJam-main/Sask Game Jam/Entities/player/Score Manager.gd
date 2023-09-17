extends Node

@onready var text_box = $RichTextLabel
@onready var global = get_node("/root/Global")

func _physics_process(_delta):
	text_box.text = "Current Time: " + str(global.score)

