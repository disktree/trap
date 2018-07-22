
import js.Browser.document;
import js.Browser.window;
import js.html.Element;
import js.html.InputElement;
import js.html.SelectElement;
import om.text.Encoder;

class App {

	static var select : SelectElement;
	static var input : InputElement;
	static var output : Element;
	static var encoder : Encoder;

	static function update() {
		var str : String = input.value;
		output.textContent = (str.length == 0) ? '' : encoder.encode( str );
	}

	static function getEncoder( name : String ) : om.text.Encoder {
		return switch name {
		case 'creepy': new om.text.Creepy();
		case 'fliprotate': new om.text.FlipRotate();
		case 'mirror': new om.text.Mirror();
		case 'trap',_: new om.text.TheTrap();
		}
	}

	static function handleTextInput(e) {
		update();
	}

	static function handleEncoderChange(e) {
		encoder = getEncoder( select.value );
		update();
	}

	static function main() {

		window.onload = function() {

			select = cast document.getElementById( 'encoding' );
			output = document.getElementById( 'output' );
			input = cast document.getElementById( 'input' );
			input.focus();

			encoder = getEncoder( select.value );

			update();

			input.addEventListener( 'input', handleTextInput, false );
			select.addEventListener( 'change', handleEncoderChange, false );
		}
	}

}
