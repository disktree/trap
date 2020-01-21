
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
				e.textContent = document.getElementById( k ).encode( str );
			}
		} else {
			for( k in encoders.keys() ) {
				document.getElementById( k ).textContent = '';
			}
		}
	}

	static function main() {

		window.onload = function() {

			outputs = document.getElementById( 'outputs' );

			input = cast document.getElementById( 'input' );
			input.addEventListener( 'input', handleTextInput, false );
			input.focus();

			encoders = [
				'fliprotate' => new om.text.FlipRotate(),
				'mirror' => new om.text.Mirror(),
				'trap' => new om.text.TheTrap(),
				'creepy' => new om.text.Creepy(),
			];

			for( k=>v in encoders ) {
				trace(k,v);
				var e = document.createDivElement();
				e.classList.add( 'encoder' );
				e.id = k;
				outputs.appendChild( e );
			}
		}
	}

}
