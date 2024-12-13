extends Node2D

## Scene that contains the explosion.
@export var explosion_prefab: PackedScene

var explosion_array: Array[Explosion]
var index: int


func _ready() -> void:
	# Create explosions
	for i in 100:
		var explosion := explosion_prefab.instantiate()
		self.add_child(explosion)
		explosion_array.append(explosion)


func spawn(location: Vector2) -> void:
	if index >= explosion_array.size() - 1:
		index = 0
	else:
		index += 1
	explosion_array[index].spawn(location)
	print(index)
