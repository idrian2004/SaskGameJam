extends Node2D

@onready var global = get_node("/root/Global")

@export var buffer_time = 40

var zone_on = true
var timer = Timer.new()


func _ready():
	add_child(timer) #adds a timer
	timer.timeout.connect(_on_timer_timeout) #connects a signal. Basically this allows the script to sense when the timer goes out.
	timer.wait_time = buffer_time
	timer.start()

func _on_area_2d_body_entered(body):
	if body.is_in_group("player") and global.score > 60 and zone_on:
		global.banked_score += global.score - 60
		global.timer_reset()
		body.get_node("UI").get_node("Health").gain_health(100)
		
		zone_on = false
		
		#insert animation or something that makes it look like the score zone is turned off
		
func _on_timer_timeout():
	zone_on = true
	
	
	#add animation that indicates that the score zone if turned on now.
