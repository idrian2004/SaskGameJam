extends Node2D

@onready var global = get_node("/root/Global")
@onready var _anim_player = $AnimationPlayer

@export var buffer_time = 40

var zone_on = true
var timer = Timer.new()


func _ready():
	zone_on = true
	_anim_player.play("Ants_food")
	
	add_child(timer) #adds a timer
	timer.timeout.connect(_on_timer_timeout) #connects a signal. Basically this allows the script to sense when the timer goes out.
	timer.wait_time = buffer_time
	timer.start()

func _on_area_2d_body_entered(body):
	if body.is_in_group("player") and global.score > 60 and zone_on:
		global.banked_score += global.score - 60
		global.timer_reset()
		body.get_node("UI").get_node("Health").gain_health(100)
		
		_anim_player.play("Ants_in")
		await _anim_player.animation_finished
		_anim_player.play("Empty")
		
		zone_on = false
		
		#insert animation or something that makes it look like the score zone is turned off
		
func _on_timer_timeout():
	_anim_player.play("Ants_out")
	await _anim_player.animation_finished
	_anim_player.play("Ants_food")
	
	timer.wait_time = buffer_time + global.difficulty*10
	
	zone_on = true
	
	
	#add animation that indicates that the score zone if turned on now.
