extends Node3D

@onready var skyflower := $skyflower
@onready var jelly_anim := $jellyfish_school/anim
@onready var bubbles_anim := $bubbles/anim
@export var dupes := 9


func _ready():
	for flower in range(dupes):
		var instance := skyflower.duplicate()
		instance.name = "Flower" + str(flower)
		instance.position = Vector3(
			randf_range(-1000, 1000),
			randf_range(0, skyflower.position.y + 100),
			randf_range(skyflower.position.z - 100, -100)
		)
		instance.rotation.x = randf_range(0, 180)
		skyflower_color(instance)
		add_child(instance)
	jelly_anim.play("hover")
	bubbles_anim.play("bubble_blast")


func skyflower_color(flower: Node3D):
	var mesh := flower.get_child(0)
	var material := StandardMaterial3D.new()
	material.albedo_color = Color(
		randf_range(0, 1), 
		randf_range(0, 1),
		randf_range(0, 1), 
		1)
	mesh.material_override = material
