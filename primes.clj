(defn get-divisors [x]
  (range 2 (inc (Math/sqrt x)) 1)
)

(defn divides? [x, y]
  (= (mod y x) 0)
)

(defn no-divisors? [x]
  (not-any? (fn [i]
   (divides? i x)
  ) (get-divisors x))
)

(defn is-prime? [x]
  (if (= x 1) 
    (false) 
    (if (= x 2) 
      (true) 
      (no-divisors? x)
    )
  )
)

(defn prime-seq [start, end]
  (filter is-prime? (range start (inc end) 1))
)

(defn print-top-primes [start, end]
  (def arr (reverse (take-last 10 (prime-seq start end))))
  (doseq [i arr] (println i))
  (println (str "Total=" (reduce + arr)))
)