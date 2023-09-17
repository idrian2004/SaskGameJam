extends Node

var score_timer = Timer.new()
var global_timer = 0
var player:Node2D

var score: int = 0
var banked_score: int = 0
var difficulty: int = 1

var timer_freeze = false

func _ready():	
	add_child(score_timer) #adds a timer
	score_timer.timeout.connect(_on_timer_timeout) #connects a signal. Basically this allows the script to sense when the timer goes out.
	score_timer.wait_time = 1
	score_timer.start()
	timer_reset()

func timer_reset():
	score = 60

func add_score(value):
	score += value
	print("add")

func _on_timer_timeout():
	if !timer_freeze:
		var dif_bonus1 = 1
		var dif_bonus2 = 0
		score -= 1
		if score % 60 == 0:
			dif_bonus1 = score/60
		if global_timer % 60 == 0:
			dif_bonus2 = global_timer/60
		difficulty = dif_bonus1 + dif_bonus2
			
func _physics_process(delta):
	global_timer += int(delta)
