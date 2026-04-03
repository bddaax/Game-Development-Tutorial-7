extends RayCast3D

var current_collider

func _ready():
	pass

func _process(_delta):
	var collider = get_collider()

	# Get interaction label from Player's HUD
	var interact_label = get_node_or_null("../../../HUD/InteractLabel")

	if is_colliding() and collider is Interactable:
		if interact_label:
			interact_label.text = "[ E ] Interact"
			interact_label.visible = true
		if Input.is_action_just_pressed("interact"):
			collider.interact()
	else:
		if interact_label:
			interact_label.visible = false
