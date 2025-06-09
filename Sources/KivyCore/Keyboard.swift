import Foundation
import UIKit
import Combine
import PySwiftKit
import PySerializing
import PyDictionary
import PySwiftWrapper


import Foundation

fileprivate extension PyPointer {
	func callMethod(_ method: PyPointer) {
		withGIL {
			PyObject_CallMethodNoArgs(self, method)
		}
		
		
	}
}

public class IOSKeyboard {
	
	static let shared = IOSKeyboard()
	
	let kivy_window = PyImport(from: "kivy.core.window", import_name: "Window")!
	let trigger_keyboard_height = "trigger_keyboard_height".pyPointer
	
	var kheight: Double = 0
	
	var willShow: AnyCancellable?
	var willHide: AnyCancellable?
	
	init() {
		willShow = NotificationCenter.default.publisher(for: UIWindow.keyboardWillShowNotification).sink { [weak self] notification in
			if let this = self {
				let height = iosWindow.bounds.height * uiScale
				this.keyboardWillShow(height: height)
				
				
			}
		}
		willHide = NotificationCenter.default.publisher(for: UIWindow.keyboardWillHideNotification).sink { [weak self] _ in
			if let this = self {
				this.keyboardWillHide()
			}
		}
	}
    

	
	deinit {
		kivy_window.decref()
		trigger_keyboard_height.decref()
	}
	
	func keyboardWillShow(height: Double) {
		kheight = height
		kivy_window.callMethod(trigger_keyboard_height)
	}
	
	func keyboardWillHide() {
		kivy_window.callMethod(trigger_keyboard_height)
	}
}

let iosKeyboard = IOSKeyboard.shared


