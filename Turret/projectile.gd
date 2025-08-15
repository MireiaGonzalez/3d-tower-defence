class_name Projectile extends Area3D

@export var speed: float = 30

var direction: Vector3 = Vector3.FORWARD

func _physics_process(delta: float) -> void:
	position += direction * speed * delta

func _on_timer_timeout() -> void:
	queue_free()
