extends Node

export var score = 0
export var lives = 3

func increase_score(s):
 score += int(s)
 find_node("Score").update_score()
 if len(get_tree().get_nodes_in_group("Tiles")) <= 1:
    get_tree().change_scene("res://Scenes/You Win.tscn")
func decrease_lives():
 lives -= 1
 find_node("Lives").update_lives()
 if lives <= 0:
    get_tree().change_scene("res://Scenes/Game Over.tscn")
 