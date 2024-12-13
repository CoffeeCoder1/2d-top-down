class_name Explosion extends Node2D


func spawn(location: Vector2) -> void:
	global_position = location
	$CPUParticles2D.emitting = true
