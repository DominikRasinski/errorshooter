extends Control

func _on_start_pressed() -> void:
	GameManager.loadLevel()

func _on_quit_pressed() -> void:
	GameManager.quitGame()
