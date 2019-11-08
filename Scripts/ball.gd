extends RigidBody2D


export var maxspeed = 300

signal lives
signal score

func _ready():
 contact_monitor = true
 set_max_contacts_reported(4)
 var WorldNode = get_node("/root/World")
 connect("score", WorldNode, "increase_score")
 connect("lives", WorldNode, "decrease_lives")

func _physics_process(delta):
 var bodies = get_colliding_bodies()
 for body in bodies:
  if body.is_in_group("Tiles"):
   emit_signal("score",body.score)
   body.queue_free() 
   get_tree().change_scene("res://Scenes/You Win.tscn")
 
  if body.get_name() == "Spider Paddle":
   body.get_node("AudioStreamPlayer").play()
  
 if position.y > get_viewport_rect().end.y:
  emit_signal("lives")
  queue_free()