class_name EnemySpawner extends Node2D

## The enemy scene to spawn.
@export var enemy_prefab: PackedScene
## The delay between enemy spawns.
@export var spawn_time: float = 5.0
## The path to spawn enemy nodes under.
@export var spawn_path: NodePath
## The Node2D to set as an enemy target.
@export var target_node: Node2D

@onready var spawn_timer: Timer = $SpawnTimer


func _ready() -> void:
	spawn_timer.wait_time = spawn_time


## Spawns an enemy.
func spawn_enemy() -> Enemy:
	var enemy := enemy_prefab.instantiate() as Enemy
	if spawn_path:
		get_node(spawn_path).add_child(enemy)
	else:
		add_child(enemy)
	return enemy


func _on_spawn_timer_timeout() -> void:
	var enemy := spawn_enemy()
	if target_node:
		enemy.target = target_node
