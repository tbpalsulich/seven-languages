; Tyler Palsulich
; Seven Languages in Seven Weeks, by Bruce A. Tate
; Clojure day 2

; Implement an unless with an else condition using macros.
; Write a type using defrecord that implements a protocol.

(ns clojure-lisp.day2
  (:gen-class))

(defmacro unless [test body else-body]		; Problem 1. Simple expansion of the macro given.
	(list 									; Code is data! Everything is a list.
		'if (list 'not test)
		body
		else-body))

(def numbers {"0" "nevereth", "1" "first", "2" "second"})	; Map to convert index to rank (for problem 2).

(defprotocol Person ; Protocol for problem 2.
	(introduce [p])	; Print the person's name.
	(greet [p])		; Say hello.
	(wave [p]))		; Wave and print how many times this person has waved.

(defrecord SimplePerson [name waves]
	Person
	(introduce [_] (println (str "\"My name is " name ".\"")))
	(greet [_] (println "\"Hello!\""))
	; Use the map to convert the number of waves to a nice string. Return a new SimplePerson with incremented wave counter.
	(wave [_] (println (str name " waves at you for the " (numbers (str (+ waves 1))) " time."))
		(SimplePerson. name (+ waves 1))))

(defn -main []
	(unless true (println "This should not print") (println "This should print"))
	(unless false (println "This should print") (println "This should not print"))
	(def tyler (SimplePerson. "Tyler" 0))
	(def newTyler (wave tyler))		; Returns a new object, so we define a new reference.
	(wave newTyler)
	(greet newTyler)
	(introduce newTyler))