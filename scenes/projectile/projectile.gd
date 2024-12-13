class_name Projectile extends Area2D

## Scene that contains the projectile.
@export var prefab: PackedScene
## Speed to move at.
@export var move_speed: float = 800.0
## How long should the projectile live?
@export var life_timer: float = 1.0

var vfx_node: Node2D = VfxPool


func _ready() -> void:
	await get_tree().create_timer(life_timer).timeout
	queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction: Vector2 = Vector2.RIGHT.rotated(rotation)
	position += direction * move_speed * delta


func _on_body_entered(body: Node2D) -> void:
	vfx_node.spawn(body.global_position)
	queue_free()
	
	if body is Enemy:
		body.take_damage(1)
