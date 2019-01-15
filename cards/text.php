<?php /*
OMACS - The online member and committee system
Copyright (C) 2018 - Joppe Blondel

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

namespace CARDS{ class text extends card_v2{
	function __construct($_id){
		parent::__construct($_id);
		$this->format[0] = array("name"=>"data", "default"=>"This is some text");
	}

	function render(){
		$text = $this->parseUBB(strip_tags($this->content['data']));
		$text = nl2br($text);
		echo $text;
	}

	function render_settings(){
?>
			<button type="button" class="btn btn-outline btn-secondary" onclick="
				var ta = document.getElementById('card_text_textarea-<?=$this->id?>');
				ta.focus();
				var sp = ta.selectionStart;
				var ep = ta.selectionEnd;
				ta.value = ta.value.substring(0,sp)+'[b]'+ta.value.substring(sp,ep)+'[/b]'+ta.value.substring(ep);
			"><i class='fa fa-bold' style='color:var(--text-light);'></i></button>

			<button type="button" class="btn btn-outline btn-secondary" onclick="
				var ta = document.getElementById('card_text_textarea-<?=$this->id?>');
				ta.focus();
				var sp = ta.selectionStart;
				var ep = ta.selectionEnd;
				ta.value = ta.value.substring(0,sp)+'[i]'+ta.value.substring(sp,ep)+'[/i]'+ta.value.substring(ep);
			"><i class='fa fa-italic' style='color:var(--text-light);'></i></button>

			<button type="button" class="btn btn-outline btn-secondary" onclick="
				var ta = document.getElementById('card_text_textarea-<?=$this->id?>');
				ta.focus();
				var sp = ta.selectionStart;
				var ep = ta.selectionEnd;
				ta.value = ta.value.substring(0,sp)+'[u]'+ta.value.substring(sp,ep)+'[/u]'+ta.value.substring(ep);
			"><i class='fa fa-underline' style='color:var(--text-light);'></i></button>

			<button type="button" class="btn btn-outline btn-secondary" onclick="
				var ta = document.getElementById('card_text_textarea-<?=$this->id?>');
				ta.focus();
				var sp = ta.selectionStart;
				var ep = ta.selectionEnd;
				ta.value = ta.value.substring(0,sp)+'[quote]'+ta.value.substring(sp,ep)+'[/quote]'+ta.value.substring(ep);
			"><i class='fa fa-quote-right' style='color:var(--text-light);'></i></button>

			<button type="button" class="btn btn-outline btn-secondary" onclick="
				var href = prompt('URL:');
				var ta = document.getElementById('card_text_textarea-<?=$this->id?>');
				ta.focus();
				var sp = ta.selectionStart;
				var ep = ta.selectionEnd;
				ta.value = ta.value.substring(0,sp)+'[img]'+href+'[/img]'+ta.value.substring(sp);
			"><i class='fa fa-image' style='color:var(--text-light);'></i></button>

			<button type="button" class="btn btn-outline btn-secondary" onclick="
				var href = prompt('URL:');
				var ta = document.getElementById('card_text_textarea-<?=$this->id?>');
				ta.focus();
				var sp = ta.selectionStart;
				var ep = ta.selectionEnd;
				ta.value = ta.value.substring(0,sp)+'[url=\''+href+'\']'+ta.value.substring(sp,ep)+'[/url]'+ta.value.substring(ep);
			"><i class='fa fa-link' style='color:var(--text-light);'></i></button>

			<button type="button" class="btn btn-outline btn-secondary jscolor {value:'000000', hash:true}" id="color<?=$this->id?>" onblur="
				var ta = document.getElementById('card_text_textarea-<?=$this->id?>');
				ta.focus();
				var sp = ta.selectionStart;
				var ep = ta.selectionEnd;
				ta.value = ta.value.substring(0,sp)+'[color='+document.getElementById('color<?=$this->id?>').innerText+']'+ta.value.substring(sp,ep)+'[/color]'+ta.value.substring(ep);
			" onmouseover="jscolor.installByClassName('jscolor')">#000000</button>

			<button type="button" class="btn btn-outline btn-secondary" onclick="
				var size = prompt('Size (px):');
				var ta = document.getElementById('card_text_textarea-<?=$this->id?>');
				ta.focus();
				var sp = ta.selectionStart;
				var ep = ta.selectionEnd;
				ta.value = ta.value.substring(0,sp)+'[size='+size+']'+ta.value.substring(sp,ep)+'[/size]'+ta.value.substring(ep);
			">Size</button>

			<textarea name="0" id="card_text_textarea-<?=$this->id?>" class="form-control card_settings-<?=$this->id?>"><?=$this->content['data']?>"</textarea>
		<?php
	}

	function parseUBB($text) {
		// BBcode array
		$find = array(
			'~\[b\](.*?)\[/b\]~s',
			'~\[i\](.*?)\[/i\]~s',
			'~\[u\](.*?)\[/u\]~s',
			'~\[quote\](.*?)\[/quote\]~s',
			'~\[size=(.*?)\](.*?)\[/size\]~s',
			'~\[color=(.*?)\](.*?)\[/color\]~s',
			'~\[url=(.*?)\](.*?)\[/url\]~s',
			'~\[img\](https?://.*?\.(?:jpg|jpeg|gif|png|bmp))\[/img\]~s'
		);
		// HTML tags to replace BBcode
		$replace = array(
			'<b>$1</b>',
			'<i>$1</i>',
			'<span style="text-decoration:underline;">$1</span>',
			'<pre>$1</'.'pre>',
			'<span style="font-size:$1px;">$2</span>',
			'<span style="color:$1;">$2</span>',
			'<a href="$1">$2</a>',
			'<img src="$1" alt="" />'
		);
		// Replacing the BBcodes with corresponding HTML tags
		return preg_replace($find,$replace,$text);
	}

}}

?>
