# OMACS - Online Member And Committee System

OMACS is an online platform which can act as a simple site engine or a member lock. OMACS is mostly written in PHP and is wrapped around UserSpice, a user login framework.

Currently OMACS is still in develompent phase. This means that the versions (v0.x.y) do not have to be stable!

Pages in OMACS are organised in so called 'cards'. A card is a small piece of page which an own header. Users which have permission to change certain pages can access settings of the cards on that page and change their behaviour or content. OMACS is shipped with a few standard card types. OMACS allows for third party card types and provides the OMACS CARDS API (currently APIv2).

### CARDS APIv2
OMACS uses so called cards. A card is a PHP class containing functions which render the card itself on the page and the settings on the page settings page. The card object should extend `card_v2`. The card **must** contain the following functions:
* `__construct($_id)`
The constructor takes an ID, a number given by OMACS to differentiate multiple cards on the page. Each HTML element which is used for interaction must contain this ID. Furthermore this fuction **must** call the parent constructor (with the same ID as only parameter). As last, the constructor must save the format of the saved data of the card in the `format` member of the parent. `format` is an array of `"name", "default"` pairs. The `name` string is the name of the saved data field. The `default` string is the default setting/content for this data field.
* `render()`
This function renders the card on the page. To access the data of the card one can use the parents `content` associative array where the key is the name of the data field. Keep in mind that all fields which provide interaction (thus uses the id tags) must contain the parents `id` member.
* `render_settings()`
This function renders the cards settings on the page settings page. The saved data can be accessed by the same member as within the `render()` function. The data saved upon a click on the save button is all the input fields with the class `card_settings-<ID>` where the `<ID>` is again the parents ID member. The data field where it's saved is specified in the name tag with the index number of the field in the `format` array. Also keep in mind that when id tags are needed to include the ID of the card in that tag!

At last, the card object must be within the CARDS namespace!

**Example**
```php
namespace CARDS{ class rawdata extends card_v2{
	function __construct($_id){
		parent::__construct($_id);
		$this->format[0] = array('name'=>'data', 'default'=>'This is some default raw data');
	}

	function render(){
		echo '<pre>';
		print_r($this->content['data']);
		echo '</pre>';
	}

	function render_settings(){
		echo "<textarea name='0' class='card_settings-". $this->id ."'>". $this->content['data'] ."</textarea>";
	}

}}
```

### Install
Installing OMACS is very simple and can be done via the provided installer. Before installing OMACS one must create a database. The rest of the install procedure is explained in `install/index.php`
