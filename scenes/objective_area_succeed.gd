extends Area2D

func _on_ObjectiveArea_body_entered(body: RigidBody2D):
	if body.name == "GreenShip":
		print("Yay! Congrats, Game Succeed!")
		await get_tree().create_timer(2.0).timeout 
		get_tree().quit()
