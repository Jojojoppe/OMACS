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

namespace CARDS{ class accordion extends card_v2{
	function __construct($_id){
		parent::__construct($_id);
		$this->format[0] = array("name"=>"headers", "default"=>"Header 1\\Header 2");
		$this->format[1] = array("name"=>"data", "default"=>"Some text for 1\\Some text for 2");
	}

	function render(){
		$headers = explode("\\", $this->content['headers']);
		unset($headers[sizeof($headers)-1]);
		$data = explode("\\", $this->content['data']);
		
		?><div class="accordion" id="accordion<?=$this->id?>"><?php
		$nr = 0;
		foreach($headers as $header){
			$header = str_replace("%0", "%", $header);
			$header = str_replace("%1", "\\", $header);
			?><div class="card border-secondary">
				<div class="card-header bg-secondary" id="heading<?=$this->id?>-<?=$nr?>">
					<h5 class="mb-0">
						<?=htmlentities($header)?>
						<button class="btn btn-secondary collapsed float-right" type="button" data-toggle="collapse" 
						data-target="#collapse<?=$this->id?>-<?=$nr?>" aria-expanded="false" aria-controls="collapse<?=$this->id?>-<?=$nr?>">
							<i class='fa fa-arrow-down' style='color:var(--text-light);'></i>
						</button>
					</h2>
				</div>
				<div id="collapse<?=$this->id?>-<?=$nr?>" class="collapse" aria-labelledby="heading<?=$this->id?>-<?=$nr?>" 
				data-parent="#accordion<?=$this->id?>">
					<div class="card-body">
<?php
			$text = str_replace("%0", "%", $data[$nr]);
			$text = str_replace("%1", "\\", $text);
			$text = $this->parseUBB(htmlentities($text));
			$text = nl2br($text);
			echo $text;
?>	
					</div>
				</div>
			</div>
<?php
			$nr++;
		}
		?></div><?php
	}

	function render_settings(){
		$headers = explode("\\", $this->content['headers']);
		$data = explode("\\", $this->content['data']);

		echo "<textarea name='0' class='d-none card_settings-".$this->id."'>".htmlentities($this->content['headers'])."</textarea>";
		echo "<textarea name='1' class='d-none card_settings-".$this->id."'>".htmlentities($this->content['data'])."</textarea>";

		$nr = 0;
		foreach($headers as $header){

			echo "<hr>";
			?>
		<div id="card_accordion_textarea_div-<?=$this->id?>-<?=$nr?>">
		<input type="text" class="form-control card_accordion_headers-<?=$this->id?>" value="<?=htmlentities($header)?>" onblur="
				var ta_s = document.getElementsByClassName('card_settings-<?=$this->id?>');
				var ta;
				for(var i=0; i<ta_s.length; i++){
					if(ta_s[i].name==0) ta = ta_s[i];
				}
				ta.value = '';
				var tas = document.getElementsByClassName('card_accordion_headers-<?=$this->id?>');
				for(var i=0; i<tas.length; i++){
					var str = tas[i].value;
					str = str.replace(/%/g, '%0');
					str = str.replace(/\\/g, '%1');
					ta.value += str;
					ta.value += '\\';
				}		
				" placeholder="Header title"><button type="button" class="btn" onclick="
					document.getElementById('card_accordion_textarea_div-<?=$this->id?>-<?=$nr?>').innerHTML = '';
				var ta_s = document.getElementsByClassName('card_settings-<?=$this->id?>');
				var ta;
				for(var i=0; i<ta_s.length; i++){
					if(ta_s[i].name==0) ta = ta_s[i];
				}
				ta.value = '';
				var tas = document.getElementsByClassName('card_accordion_headers-<?=$this->id?>');
				for(var i=0; i<tas.length; i++){
					var str = tas[i].value;
					str = str.replace(/%/g, '%0');
					str = str.replace(/\\/g, '%1');
					ta.value += str;
					ta.value += '\\';
				}	
				for(var i=0; i<ta_s.length; i++){
					if(ta_s[i].name==1) ta = ta_s[i];
				}
				ta.value = '';
				tas = document.getElementsByClassName('card_accordion_textarea-<?=$this->id?>');
				for(var i=0; i<tas.length; i++){
					var str = tas[i].value;
					str = str.replace(/%/g, '%0');
					str = str.replace(/\\/g, '%1');
					ta.value += str;
					ta.value += '\\';
				}	
">Delete header</button>
<?php
			$this->show_rich_textarea($this->id."-".$nr, htmlentities($data[$nr]));
			$nr++;
			echo "</div>";
		}
	}

	function parseUBB($text) {
		// BBcode array
		$find = array(
			'~\[b\](.*?)\[/b\]~s',
			'~\[i\](.*?)\[/i\]~s',
			'~\[u\](.*?)\[/u\]~s',
			'~\[p\](.*?)\[/p\]~s',
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
			'<p style="display:inline">$1</p>',
			'<pre style="display:inline">$1</'.'pre>',
			'<span style="font-size:$1px;">$2</span>',
			'<span style="color:$1;">$2</span>',
			'<a href="$1">$2</a>',
			'<img src="$1" alt="" />'
		);
		// Replacing the BBcodes with corresponding HTML tags
		return preg_replace($find,$replace,$text);
	}

	function show_rich_textarea($id, $data){
?>
			<button type="button" class="btn btn-outline btn-secondary" onclick="
				var ta = document.getElementById('card_text_textarea-<?=$id?>');
				ta.focus();
				var sp = ta.selectionStart;
				var ep = ta.selectionEnd;
				ta.value = ta.value.substring(0,sp)+'[b]'+ta.value.substring(sp,ep)+'[/b]'+ta.value.substring(ep);
			"><i class='fa fa-bold' style='color:var(--text-light);'></i></button>

			<button type="button" class="btn btn-outline btn-secondary" onclick="
				var ta = document.getElementById('card_text_textarea-<?=$id?>');
				ta.focus();
				var sp = ta.selectionStart;
				var ep = ta.selectionEnd;
				ta.value = ta.value.substring(0,sp)+'[i]'+ta.value.substring(sp,ep)+'[/i]'+ta.value.substring(ep);
			"><i class='fa fa-italic' style='color:var(--text-light);'></i></button>

			<button type="button" class="btn btn-outline btn-secondary" onclick="
				var ta = document.getElementById('card_text_textarea-<?=$id?>');
				ta.focus();
				var sp = ta.selectionStart;
				var ep = ta.selectionEnd;
				ta.value = ta.value.substring(0,sp)+'[u]'+ta.value.substring(sp,ep)+'[/u]'+ta.value.substring(ep);
			"><i class='fa fa-underline' style='color:var(--text-light);'></i></button>

			<button type="button" class="btn btn-outline btn-secondary" onclick="
				var ta = document.getElementById('card_text_textarea-<?=$id?>');
				ta.focus();
				var sp = ta.selectionStart;
				var ep = ta.selectionEnd;
				ta.value = ta.value.substring(0,sp)+'[p]'+ta.value.substring(sp,ep)+'[/p]'+ta.value.substring(ep);
			"><i class='fa fa-paragraph' style='color:var(--text-light);'></i></button>

			<button type="button" class="btn btn-outline btn-secondary" onclick="
				var ta = document.getElementById('card_text_textarea-<?=$id?>');
				ta.focus();
				var sp = ta.selectionStart;
				var ep = ta.selectionEnd;
				ta.value = ta.value.substring(0,sp)+'[quote]'+ta.value.substring(sp,ep)+'[/quote]'+ta.value.substring(ep);
			"><i class='fa fa-quote-right' style='color:var(--text-light);'></i></button>

			<button type="button" class="btn btn-outline btn-secondary" onclick="
				var href = prompt('URL:');
				var ta = document.getElementById('card_text_textarea-<?=$id?>');
				ta.focus();
				var sp = ta.selectionStart;
				var ep = ta.selectionEnd;
				ta.value = ta.value.substring(0,sp)+'[img]'+href+'[/img]'+ta.value.substring(sp);
			"><i class='fa fa-image' style='color:var(--text-light);'></i></button>

			<button type="button" class="btn btn-outline btn-secondary" onclick="
				var href = prompt('URL:');
				var ta = document.getElementById('card_text_textarea-<?=$id?>');
				ta.focus();
				var sp = ta.selectionStart;
				var ep = ta.selectionEnd;
				ta.value = ta.value.substring(0,sp)+'[url=\''+href+'\']'+ta.value.substring(sp,ep)+'[/url]'+ta.value.substring(ep);
			"><i class='fa fa-link' style='color:var(--text-light);'></i></button>

			<button type="button" class="btn btn-outline btn-secondary jscolor {value:'000000', hash:true}" id="color<?=$id?>" onblur="
				var ta = document.getElementById('card_text_textarea-<?=$id?>');
				ta.focus();
				var sp = ta.selectionStart;
				var ep = ta.selectionEnd;
				ta.value = ta.value.substring(0,sp)+'[color='+document.getElementById('color<?=$this->id?>').innerText+']'+ta.value.substring(sp,ep)+'[/color]'+ta.value.substring(ep);
			" onmouseover="jscolor.installByClassName('jscolor')">#000000</button>

			<button type="button" class="btn btn-outline btn-secondary" onclick="
				var size = prompt('Size (px):');
				var ta = document.getElementById('card_text_textarea-<?=$id?>');
				ta.focus();
				var sp = ta.selectionStart;
				var ep = ta.selectionEnd;
				ta.value = ta.value.substring(0,sp)+'[size='+size+']'+ta.value.substring(sp,ep)+'[/size]'+ta.value.substring(ep);
			">Size</button>

			<textarea name="0" id="card_text_textarea-<?=$id?>" class="form-control card_accordion_textarea-<?=$this->id?>"
			onblur="
				var ta_s = document.getElementsByClassName('card_settings-<?=$this->id?>');
				var ta;
				for(var i=0; i<ta_s.length; i++){
					if(ta_s[i].name==1) ta = ta_s[i];
				}
				ta.value = '';
				var tas = document.getElementsByClassName('card_accordion_textarea-<?=$this->id?>');
				for(var i=0; i<tas.length; i++){
					var str = tas[i].value;
					str = str.replace(/%/g, '%0');
					str = str.replace(/\\/g, '%1');
					ta.value += str;
					ta.value += '\\';
				}			
			"><?=$data?></textarea>
		<?php

	}

}}

?>
