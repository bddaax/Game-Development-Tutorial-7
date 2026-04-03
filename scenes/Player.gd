extends CharacterBody3D

@onready var camera: Camera3D = $Head/Camera3D
@onready var head: Node3D = $Head

@export var speed: float = 10.0
@export var sprint_speed: float = 18.0
@export var crouch_speed: float = 4.0
@export var acceleration: float = 5.0
@export var gravity: float = 9.8
@export var jump_power: float = 5.0
@export var mouse_sensitivity: float = 0.3

var camera_x_rotation: float = 0.0
var is_crouching: bool = false
var default_head_y: float
var crouch_head_y: float

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	default_head_y = head.position.y
	crouch_head_y = default_head_y - 0.5

func _input(event):
	# Click to recapture mouse
	if event is InputEventMouseButton and event.pressed:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		head.rotate_y(deg_to_rad(-event.relative.x * mouse_sensitivity))

		var x_delta = event.relative.y * mouse_sensitivity
		camera_x_rotation = clamp(camera_x_rotation + x_delta, -90.0, 90.0)
		camera.rotation_degrees.x = -camera_x_rotation

func _physics_process(delta):
	# Determine current speed
	var current_speed = speed
	var is_sprinting = false

	# Crouch handling
	if Input.is_action_pressed("crouch"):
		is_crouching = true
	else:
		is_crouching = false

	if Input.is_action_pressed("sprint") and not is_crouching:
		current_speed = sprint_speed
		is_sprinting = true
	elif is_crouching:
		current_speed = crouch_speed

	# Smooth head height transition for crouch
	var target_head_y = crouch_head_y if is_crouching else default_head_y
	head.position.y = lerp(head.position.y, target_head_y, 10.0 * delta)

	# Movement
	var movement_vector = Vector3.ZERO

	if Input.is_action_pressed("movement_forward"):
		movement_vector -= head.basis.z
	if Input.is_action_pressed("movement_backward"):
		movement_vector += head.basis.z
	if Input.is_action_pressed("movement_left"):
		movement_vector -= head.basis.x
	if Input.is_action_pressed("movement_right"):
		movement_vector += head.basis.x

	movement_vector = movement_vector.normalized()

	velocity.x = lerp(velocity.x, movement_vector.x * current_speed, acceleration * delta)
	velocity.z = lerp(velocity.z, movement_vector.z * current_speed, acceleration * delta)

	# Apply gravity
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Jumping (can't jump while crouching)
	if Input.is_action_just_pressed("jump") and is_on_floor() and not is_crouching:
		velocity.y = jump_power

	move_and_slide()

	# Update HUD sprint/crouch indicator
	var sprint_label = get_node_or_null("HUD/SprintLabel")
	if sprint_label:
		if is_sprinting:
			sprint_label.text = "SPRINTING"
			sprint_label.visible = true
		elif is_crouching:
			sprint_label.text = "CROUCHING"
			sprint_label.visible = true
		else:
			sprint_label.visible = false
