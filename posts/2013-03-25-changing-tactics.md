---
title: changing tactics
---

Most of my friends (and some of my family) know I'm into this "functional programming" thing.  While not a lot of them truly understand what it means, (and I'm still learning) I know that I prefer functional programming.  At a very basic level it appeals to the fact that I find math very beautiful.  Also, there are a lot of cool things & side benefits (and headaches) when it comes to functional programming.  My favorite language in that space (so far) is [Haskell](http://www.haskell.org/haskellwiki/Haskell) and while it is a very cool language, for a few projects I am looking to work on it will be impractical to use Haskell.

As a prime example, I'm going to be building a work order system for my employer.  Currently they use Quickbooks for all their billing & will probably keep on using it until the end of time.  In order to work with it I need to either:

  1. use Java
  2. use .NET

What is nice, is there are languages that lay on top of these technologies so I can use all the spiffy functional stuff & still leverage the advantage of those platforms.  (Did I really just say that?  Woah!  That was like, straight [Enterprise Software](https://github.com/Mikkeren/FizzBuzzEnterpriseEdition) speak)  For .NET they have [F#](http://fsharp.org/) which looks pretty cool & is on the list of things to learn.  In Java-land (and Javascript & .NET) there's [Clojure](http://clojure.org/) which is a [Lisp](http://en.wikipedia.org/wiki/Lisp_(programming_language)) derivative.

So my choices are: learn F#, learn Clojure, or write a wrapper for QBXML...

I'm not writing a wrapper... that will take *way* too long & too much time.

F# is nice, but it's kind of hard to run on a *nix box, and thus may be impractical for development on my main machine (I'm currently running [Archlinux](https://www.archlinux.org/)).

Clojure... Clojure seems to be the language that I'm going to focus most of my learning energies on.  I say most because I'm also reading [Structure and Interpretation of Computer Programs](http://landoflisp.com/), and [Land of Lisp](http://landoflisp.com/), so, in a sense, I'm learning 3 variations of the same language (Scheme is used in SICP, which is a minimalist dialect of Lisp).  In a sense, that means I'm going to be able to learn more while studying less (or not as hard anyway).  I've already started on the [Clojure Koans](http://clojurekoans.com/) and I need to start running through some [tutorials](http://learn-clojure.com/clojure_tutorials.html) but I think, overall this is the best way for me to go!

...and I can focus on learning practical stuff instead of learning mind-bendy cool stuff.  While mind-bendy stuff is very cool, it's not always the best thing if you're just trying to make some $\$\$!
