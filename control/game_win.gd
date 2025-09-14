extends Control

func _on_retry_pressed() -> void:
	GameManager.loadLevel()

func _on_quit_pressed() -> void:
	GameManager.quitGame()
