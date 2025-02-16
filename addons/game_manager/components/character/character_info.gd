class_name GameManager__CharacterInfo extends Resource

@export var id: int = -1
@export var name: String = ""
@export_multiline var description: String = ""
@export var image: AtlasTexture = AtlasTexture.new()
@export var type: CharacterType = CharacterType.UNKNOWN

func set_id(val: int) -> GameManager__CharacterInfo:
	id = val
	return self

func set_char_name(val: String) -> GameManager__CharacterInfo:
	name = val
	return self

func set_description(val: String) -> GameManager__CharacterInfo:
	description = val
	return self

func set_image(val: AtlasTexture) -> GameManager__CharacterInfo:
	image = val
	return self

func set_type(val: CharacterType) -> GameManager__CharacterInfo:
	type = val
	return self

enum CharacterType {NPC, ENEMY, BOSS, PLAYER, UNKNOWN}
