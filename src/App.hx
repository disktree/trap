
import js.Browser.document;
import js.Browser.window;
import js.html.Element;
import js.html.InputElement;
import om.text.Encoder;

class App {

	static var input : InputElement;
	static var outputs : Element;
	static var encoders : Map<String,Encoder>;

	static function handleTextInput(e) {
		var str : String = input.value;
		if( str.length > 0 ) {
			for( k=>v in encoders ) {
				untyped document.getElementById( k ).value = v.encode( str );
				//e.textContent = document.getElementById( k ).encode( str );
			}
		} else {
			for( k in encoders.keys() ) {
				untyped document.getElementById( k ).value = '';
			}
		}
	}

	static function main() {

		window.onload = function() {

			outputs = document.getElementById( 'outputs' );

			input = cast document.getElementById( 'input' );
			input.addEventListener( 'input', handleTextInput, false );
			input.onclick = function(e){
				e.preventDefault();
				e.stopPropagation();
				input.select();
			}
			input.focus();

			encoders = [
				'fliprotate' => new om.text.FlipRotate(),
				'mirror' => new om.text.Mirror(),
				'trap' => new om.text.TheTrap(),
				'creepy' => new om.text.Creepy(),
			];

			for( k=>v in encoders ) {
				//trace(k,v);
				var input = document.createInputElement();
				input.type = "text";
				input.id = k;
				input.setAttribute( 'readonly', '' );
				input.classList.add( 'encoder' );
				input.onclick = function(e){
					e.preventDefault();
					e.stopPropagation();
					input.select();
				}
				outputs.appendChild( input );
			}
		}
	}

}
