extends Node

@onready var text_box = $RichTextLabel
@onready var prog_bar = $ProgressBar
@onready var global = get_node("/root/Global")

var sb = StyleBoxFlat.new()

func _ready():
	prog_bar.add_theme_stylebox_override("fill", sb)
	
func _physics_process(_delta):
	prog_bar.value = int(global.score)

	if prog_bar.value > 60:
		sb.bg_color = Color("ff0000")
		text_box.text = "[center]!!! Too Much Food Strengthens Enemies: " + str(global.score) + " !!!"
	else:
		sb.bg_color = Color("e69842")
		text_box.text = "[center]Food Left: " + str(global.score)

