extends Control

class_name PaperUI

@onready var text: RichTextLabel = $Panel/Text

func _ready():
	UiActions.interact_paper.connect(display_paper)
	
func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		visible = false
		get_tree().paused = false

func display_paper(title: PaperManager.Names):
	get_tree().paused = true
	visible = true
	text.text = PaperManager.content.get(title)
