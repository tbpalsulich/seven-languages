; Tyler Palsulich
; Seven Languages in Seven Weeks, by Bruce A. Tate
; Clojure day 1

(ns clojure-lisp.day1
  (:gen-class))

(defn big
  "big [st n] returns whether st is longer than n characters."
  [st n]
  (> (count st) n))

(defn collection-type
  "collection-type [col] returns the type of col."
  [col]
  (cond
  	(list? col) :list
  	(map? col) :map
  	(vector? col) :vector
  	:else nil)
  )

(defn -main []
  (println (big "test" 3))  ; True
  (println (big "test" 4))  ; False
  (println (big "test" 5))  ; False
	(println (collection-type [1 2 3 4])) 				; :vector
	(println (collection-type '(1 2 3 4))) 				; :list
	(println (collection-type {:one 1, :two 2}))	; :map
	(println (collection-type "I don't know")))   ; nil