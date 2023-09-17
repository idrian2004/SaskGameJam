extends Node

@export var debug = false
@export var bar_visible = false
@export var max_health = 100

var health = max_health

const DAMAGE_AMOUNT = 1

signal health_zero


# Called when the node enters the scene tree for the first time.
func _ready():
	if bar_visible == false:
		$CenterContainer/Hbar.visible = false
	update_health_bar()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("damage_player") and debug:
		take_damage(1)
	if health <= 0:
		# Player has died
		#get_tree().reload_current_scene()
		emit_signal("health_zero")
		
# Update Health Bar value
func update_health_bar():
	$CenterContainer/Hbar.value = health


# Function for entity taking damage
func take_damage(damage):
	health -= damage
	if health <= 0:
		health = 0
	update_health_bar()

func gain_health(hp):
	health += hp
	if health >= max_health:
		health = max_health
	update_health_bar()
	



