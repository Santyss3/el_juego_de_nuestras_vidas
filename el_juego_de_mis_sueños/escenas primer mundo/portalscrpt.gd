extends Area2D

export(String, FILE, "*.tscn") var next_scene_path

func _on_Portal_body_entered(body):
	if body.name == "pj":
		get_tree().change_scene("res://escenas primer mundo/+mundolevel1+.tscn")
	pass # Reemplazar con cuerpo de función
