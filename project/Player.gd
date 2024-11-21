extends CharacterBody3D

var target_velocity := Vector3.ZERO
@export var speed := 1.0
@export var fall_acceleration := 150.0
@onready var start_y := position.y


func _physics_process(delta):
	var direction := Vector3.ZERO
	
	if Input.is_action_pressed("Right"):
		direction.x += speed
	if Input.is_action_pressed("Left"):
		direction.x -= speed
	if Input.is_action_pressed("Forward"):
		direction.z -= speed
	if Input.is_action_pressed("Backward"):
		direction.z += speed

	if direction != Vector3.ZERO:
		$Patrick.basis = Basis.looking_at(direction)

	if Input.is_action_pressed("Jump") and is_on_floor():
		direction.y += speed * 15
	
	target_velocity = direction * speed
	
	if not is_on_floor():
		target_velocity.y -= fall_acceleration * delta

	velocity = target_velocity
	move_and_slide()
