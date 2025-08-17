class_name Enemy extends PathFollow3D

@export var speed: float = 2.5
@export var max_health: int = 50
@export var gold_for_enemy_killed: int = 15

@onready var base: Base = get_tree().get_first_node_in_group("base")
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var bank: Bank = get_tree().get_first_node_in_group("bank")

var current_health: int:
	set(updated_health):
		current_health = updated_health
		if current_health < 1:
			queue_free()
			bank.gold += gold_for_enemy_killed
	get:
		return current_health

func _ready() -> void:
	current_health = max_health

func _process(delta: float) -> void:
	progress += speed * delta
	if progress_ratio == 1:
		set_process(false)
		queue_free()
		base.take_damage()
		

func take_damage(damage: int):
	current_health -= damage
	animation_player.play("TakeDamage")
