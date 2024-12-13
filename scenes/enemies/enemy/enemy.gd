class_name Enemy extends CharacterBody2D

@export var move_speed: float = 250.0
@export var max_health: int = 1
@export var target: Node2D

var health: int = max_health


func _physics_process(delta: float) -> void:
	if target:
		var direction: Vector2 = global_position.direction_to(target.global_position)
		velocity = direction * move_speed
		look_at(target.global_position)
		
		move_and_slide()


func take_damage(damage: int) -> void:
	health -= damage
	
	if health == 0:
		queue_free()
