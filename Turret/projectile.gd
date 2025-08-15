class_name Projectile extends Area3D

@export var speed: float = 30

var direction: Vector3 = Vector3.FORWARD

func _physics_process(delta: float) -> void:
	position += direction * speed * delta

func _on_timer_timeout() -> void:
	queue_free()

func _on_area_entered(area: Area3D) -> void:
	if area.is_in_group("enemy_area"):
		var enemy = area.get_parent() as Enemy
		enemy.take_damage(15)
		queue_free()
