---
title: programming hard or hardly programming
---

I just found [this article](http://thedailywtf.com/Articles/Programming-Sucks!-Or-At-Least,-It-Ought-To-.aspx) on [The Daily WTF](http://thedailywtf.com/).  After reading it, I began to think to myself: "Am I really choosing the right language / environment for the apps i might write?" and "Am I simply doing all this right?"

On the one hand, Java runs on (damn near) anything, so running it on a Windows machine (should be) just as easy as getting it to run on a Linux machine.  On the other hand, there are databases to consider, and from all that I've heard, running PostgreSQL or MySQL on a Windows machine - while not impossible - is difficult.  So now I'm torn, keep learning Clojure, or learn something else.  Also, I would need to find a decent database, thats cheap (aka free) that runs on Windows & has no limitations (or at least the same limitations as say, MySQL).  Hostly I don't know any database very well, so PostgreSQL, MySQL (or MariaDB), MongoDB, CouchDB, or even learning Access DB would be 9/10 the same.  The functionality is different, sure, but I need to keep things small in order to be sure that I can handle everything.  And even though I might be able to think about & administer the system, I may need to hand it off to somebody at some later time, so keeping the code as readable & open as possible is best.  I mean, I love the guys at my shop, so I don't want to leave them in a situation where they have to hire an "expert Objective D# programmer" just to make some changes to their app.  F# may be just as cool (if not cooler than) Clojure, but would they be better served if i wrote it all in that or C#?  Or something else entirely???

There is also the question of "Am I doing this right?"  This is something I often think about when I'm programming: "Am I doing this in the most effective way that gets across my point and wont confuse me (or someone else) later?"  Sometimes I do it wrong, like in this instance (taken from my [Clojure and Rosalind](2013-04-02-clojure-and-rosalind.html) project):

~~~~ {.clojure .numberLines}
(ns rosalind.basics)

(defn dna-counter-fn
  "This actually does the counting"
  [dna cnt]
  (loop [d dna
         c cnt]
    (let [l (first d)
          r (rest d)]
      (case l
          \A (def h (assoc c :A (+ 1 (:A c))))
          \G (def h (assoc c :G (+ 1 (:G c))))
          \C (def h (assoc c :C (+ 1 (:C c))))
          \T (def h (assoc c :T (+ 1 (:T c))))
          nil)
      (if (empty? r)
        h
        (recur r h)))))

(defn dna-count
  "Counts DNA Nucleotides"
  [dna]
  (let [h (dna-counter-fn dna {:A 0 :C 0 :T 0 :G 0})]
    [(:A h) (:C h) (:G h) (:T h)]))
~~~~~

My code went from that, to this (when I remembered that fold & reduce are staples in functional languages...):

~~~~ {.clojure .numberLines}
(ns rosalind.basics)

(defn count-dna
  "Counts DNA Nucleotides"
  [dna-str]
  (reduce (fn [c base]
      (case base
          \A (assoc c :A (+ 1 (:A c)))
          \G (assoc c :G (+ 1 (:G c)))
          \C (assoc c :C (+ 1 (:C c)))
          \T (assoc c :T (+ 1 (:T c)))
          nil))
    {:A 0 :C 0 :T 0 :G 0}
    dna-str))
;; ...
~~~~~

The second is definitely shorter, and for anyone who knows how to program in that language, they have a better sense of what the code is doing in the latter, as compared to the former.  I don't mind being wrong.  In fact, so much so that pretty much all of the code that I've ever written is [up on GitHub](https://github.com/serialhex/) and I'm not afraid of anyone going through the history.  In fact, if you want to see those 2 commits you can go [here for the first](https://github.com/serialhex/rosalind/commit/a2dda9e34cfeba5c8b7aa6428d67050b21c16831#diff-5) and a [link for the refactoring](https://github.com/serialhex/rosalind/commit/ee2459a66fe5e680002bb212ab6c874a66735bfd#diff-0).  (again, you should only really browse the code if you're not going to solve the Project Rosalind stuff or you've already solved it, because there are answers there... exposed!)  There is a little more to it than is in that commit, mainly the function no longer returns a vector but a map, but in the end it is easier to read & more comprehensible to other developers.  So, if i were to build this big spiffy app in Clojure or C# or JavaScript or [INTERCAL](http://esolangs.org/wiki/INTERCAL) would it be as comprehensible as possible to my future self or someone there to replace me?

...maybe I should get a "replies" section to my blog so people can post stuff in response to my ramblings... or you can just head over to my Google+ page & respond there: [Justin P.](https://plus.google.com/116540783463865722751/posts)
