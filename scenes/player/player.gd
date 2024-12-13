class_name Player extends CharacterBody2D

@export var projectile_prefab: PackedScene
## Speed to move at.
@export var move_speed: float = 400.0
## Speed to rotate at.
@export var rotation_speed: float = 100.0

@onready var body: Sprite2D = %Body
@onready var left_hand_spawn_point: Marker2D = %LeftHandSpawnPoint
@onready var right_hand_spawn_point: Marker2D = %RightHandSpawnPoint


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("fire_1"):
		var projectile := projectile_prefab.instantiate() as Projectile
		add_child(projectile)
		projectile.global_position = right_hand_spawn_point.global_position
		projectile.global_rotation = right_hand_spawn_point.global_rotation


func _physics_process(delta: float) -> void:
	var direction: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * move_speed
	
	body.look_at(get_global_mouse_position())
	
	move_and_slide()
