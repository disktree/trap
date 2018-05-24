
import js.Browser.document;
import js.Browser.window;
import js.html.Element;
import js.html.InputElement;
import om.text.TheTrap;

class App {

	static var input : InputElement;
	static var output : Element;

	static function format() {
		var str : String = input.value;
		if( str.length == 0 ) {
			output.textContent = '';
		} else {
			var result = TheTrap.convert( str );
			output.textContent = result;
		}
	}

	static function handleTextInput(e) {
		format();
	}

	static function main() {

		window.onload = function() {

			input = cast document.getElementById( 'input' );
			output = document.getElementById( 'output' );

			var textarea = document.getElementById( 'input' );
			textarea.focus();

			format();

			textarea.addEventListener( 'input', handleTextInput, false );
		}
	}
	
}
