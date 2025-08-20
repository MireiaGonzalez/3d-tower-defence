extends Path3D

@export var enemy_scene: PackedScene
@export var difficulty_manager: DifficultyManager
@export var victory_layer: VictoryLayer

@onready var timer: Timer = $Timer

func spawn_enemy() -> void:
	var new_enemy = enemy_scene.instantiate() as Enemy
	new_enemy.max_health = difficulty_manager.get_enemy_health()
	add_child(new_enemy)
	timer.wait_time = difficulty_manager.get_spawn_time()
	new_enemy.tree_exited.connect(enemy_defeated)

func _on_difficulty_manager_stop_spawning_enemies() -> void:
	timer.stop()

func enemy_defeated() -> void:
	if timer.is_stopped():
		for child in get_children():
			if child is Enemy:
				return
		print("You won")
		victory_layer.victory()
