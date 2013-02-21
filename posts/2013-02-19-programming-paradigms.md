---
title: programming paradigms
---

Talking to my brother the last few days made me realize that he doesn't realize that all of the languages that he is learning in school all use the same programming paradigms, and are even derivatives of one another.  Now, some of this isn't bad, in order to program a game on the Xbox you need to know how to program in C#, and if you already know C++ it is very easy to make the transition between the two (some people may even make simple mistakes because of this).

In fact, it is rather trivial to make the transition between any of the C-based languages because they share much syntax and style in the manner of *how* you solve a problem.  The point i was (and frankly still am) trying to make is that different languages allow you to think about problems in different ways.  While all (useful) languages are [Turing Complete](http://en.wikipedia.org/wiki/Turing_completeness) using something like [Malbolge](http://en.wikipedia.org/wiki/Malbolge) is probably going to get you nowhere if you want something useful.  Yes it is Turing Complete, but programming in it is so hard that solving problems in it is a challenge in and of itself.  This is where I encountered my first problem.

My brother is going to one of the best schools for programming in New York (or so he says its one of the best schools).  I was talking to him about [Object Oriented Programming](http://en.wikipedia.org/wiki/Object-oriented_programming) which is what (most) of todays popular languages use as it's main paradigm.  For some strange reason, he didn't know what Object Oriented design & programming was.  The only distinction he makes between languages is whether it's a scripting language or a compiled language... which has no bearing on the *way* you solve programs in it.  Haskell can be run either compiled or as a script, so is it a scripting language, or a compiled language?  What matters more is how do you *think* in that language, how do you **solve problems?**

<div class="note"> (Quick note: apparently there are C scripting environments where you feed in your source code & it runs it like a script!!!  They even have a [REPL](http://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop) interpreter!!!!  OH NO!!! C IS A SCRIPTING LANGUAGE!!! HOW HORRIBLE!!!!  The delinquent parties: [Ch](http://www.softintegration.com/) and [CINT](http://root.cern.ch/drupal/content/cint))</div>

In languages such as C, C++, C#, Objective-C, Java, Perl, Ruby, Python, PHP and Go, you solve problems in very similar ways.  In fact, I've written a program to translate a number of Python examples to Ruby in [Shogun](https://github.com/serialhex/fun-stuff/blob/e1d9e91478de41f27a9287e420f711fdbcac6cf8/trancekoder.rb) (it was once in the Shogun repo, it's in the history somewhere... and looking at it, it's an okay example of an object oriented program.)  That's not to say that they are *all the same language,* just there are a lot of similarities in the languages.  All (except C) are object oriented languages, and all have similar syntax, for instance:

~~~~~ {#code .c .numberLines}
// C
#include <stdio.h>
int main(int argc, char *argv[])
{
    printf("Hello, world!\n");
    return 0;
}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~ {#code .cpp .numberLines}
// C++
#include <iostream>
using namespace std;
int main()
{
    cout << "Hello, world!" << endl;
    return 0;
}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~ {#code .go .numberLines}
// Go
import "fmt"

func main() {
  fmt.Println("Hello, World!")
}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~ {#code .cs .numberLines}
// C#
using System;
class Program
{
    public static void Main()
    {
        Console.WriteLine("Hello, world!");
        Console.ReadKey(true);
    }
}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~ {#code .objectivec .numberLines}
// Objective C
#import <stdio.h>
 
int main(void)
{
    printf("Hello, world!\n");
    return 0;
}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~ {#code .scala .numberLines}
// scala
object HelloWorld extends App {
  println("Hello, world!")
}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Unfortunately, just looking at "Hello World" examples isn't going to get us very far in showing us *how* to program in said language take [Malbolge](http://en.wikipedia.org/wiki/Malbolge) for instance:

~~~~~ {#code .numberLines}
('&%:9]!~}|z2Vxwv-,POqponl$Hjig%eB@@>}=<M:9wv6WsU2T|nm-,jcL(I&%$#"
`CB]V?Tx<uVtT`Rpo3NlF.Jh++FdbCBA@?]!~|4XzyTT43Qsqq(Lnmkj"Fhg${z@>
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**That** is "Hello World" in Malbolge, how does it work?  Read the [Wikipedia article](http://en.wikipedia.org/wiki/Malbolge) cause I can't explain it.  Anyway, that's not the point!  The point is programming pradigms, and that's what I'm going to show you! (-ish)

----------

There is an awesome website:  [99-bottles-of-beer.net](http://www.99-bottles-of-beer.net/) which has *thousands* of examples of code for the song, 99 bottles of beer!  Which is a more challenging project (and one I can sensibly put here)  So without further ado, the code:

Here is a [C version done by Dustshine](http://www.99-bottles-of-beer.net/language-c-844.html)

~~~~~ {#code .c .numberLines}
#include <stdio.h>

int main(void)
{       
        int b;
        
        for (b = 99; b >= 0; b--) {
                switch (b) {
                case 0:
                        printf("No more bottles of beer on the wall, no more bottles of beer.\n");
                        printf("Go to the store and buy some more, 99 bottles of beer on the wall.\n");
                        break;
                case 1:
                        printf("1 bottle of beer on the wall, 1 bottle of beer.\n");
                        printf("Take one down and pass it around, no more bottles of beer on the wall\n");
                        break;
                default:
                        printf("%d bottles of beer on the wall, %d bottles of beer.\n", b, b);     
                                   printf("Take one down and pass it around, %d %s of beer on the wall.\n"
                                ,b - 1
                                ,((b - 1) > 1)? "bottles" : "bottle");
                        break;
                }
        }       
        
        return 0;
}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This is done in an imperative style.  First you have the declarations, then the function `int main(void)` and next, you declare an `int` named `b` which, when we enter into the `for` loop, decreases from 99 to 0.  Inside that, we have a `switch` statement that looks at `b` and decides which version of the lyrics we shall output.  While this isn't a horrible way to program, it's very verbose, and quite inflexible.  if you wanted to change it from, say, beer to Nuka Cola, well, you'd have to change it in 9 separate places.  And yes, while refactoring you can make it more streamlined and whatnot, but this would be a typical implementation for most people.  (Unless you want to be spiffy and make a [Linux kernel driver](http://www.99-bottles-of-beer.net/language-c-820.html))

----------

Next on our list, is Object Oriented, the most common today!  This is done in [C++ by Tim Robinson](http://www.99-bottles-of-beer.net/language-c++-111.html)

~~~~~ {#code .cpp .numberLines}
// C++ version of 99 Bottles of Beer, object oriented paradigm
// programmer: Tim Robinson timtroyr@ionet.net
// with some edits by serialhex to make it work with g++
#include <iostream>
using namespace std;

enum Bottle { BeerBottle };

class Shelf {
    unsigned BottlesLeft;
public:
    Shelf( unsigned bottlesbought )
        : BottlesLeft( bottlesbought )
        {}
    void TakeOneDown()
        {
        if (!BottlesLeft)
            throw BeerBottle;
        BottlesLeft--;
        }
    operator int () { return BottlesLeft; }
    };

int main( )
    {
    Shelf Beer(99);
    try {
        for (;;) {
            const char *plural = (int)Beer !=1 ? "s" : "";
            cout << (int)Beer << " bottle" << plural
                 << " of beer on the wall," << endl;
            cout << (int)Beer << " bottle" << plural
                 << " of beer," << endl;
            Beer.TakeOneDown();
            cout << "Take one down, pass it around," << endl;
            plural = (int)Beer !=1 ? "s":"";
            cout << (int)Beer << " bottle" << plural
                 << " of beer on the wall." << endl;
            }
        }
    catch ( Bottle ) {
        cout << "Go to the store and buy some more," << endl;
        cout << "99 bottles of beer on the wall." << endl;
        }
    return 0;
    }
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Of course, the imports are first, then sets up the `enum Bottle` collection.  Next, he sets up our `Shelf` class, a class being the basis of objects in most object oriented languages (put another way: each object has one or more classes).  Then he defines some public functions for us to use: `Shelf`, is the constructor, it is the function that is called when we make our object, and it takes an integer, (and `unsigned` integer to be exact) as the number of `BottlesLeft`; then we have our `TakeOneDown` function; which throws a `BeerBottle` exception if `BottlesLeft` is ever `False` or `0` (because in C, C++ and a bunch of other languages `0` in an `if` statement is the same as `False` in an `if` statement) and decrements `BottlesLeft`.  The rest of the code is imperative-style with a for-loop within a try-catch block.  It's more total LOC than the  purely-imperative style, but the advantage is you can use the `Shelf` class anywhere (theoretically) and if you want to add functionality, you just have to add it to that class, or change how many bottles are on the shelf.  (and technically, the output of the program is incorrect... but we'll be okay)

----------

Now Haskell, one of my favorite languages!  This is actually a variation on the one labeled [Using guards](http://www.99-bottles-of-beer.net/language-haskell-1613.html) on the 99 bottles site (I'm doing a little bit of refactoring to make the code a bit cleaner IMO)

~~~~~ {#code .haskell .numberLines}
--Version of http://99-bottles-of-beer.net/language-haskell-1070.html
--using guards.
-- some edits by serialhex, to make it look & work a bit spiffier

import Data.Char

bottles :: Int -> String
bottles n
        |n == 0 = "no more bottles"
        |n == 1 = "1 bottle"
        |n >  1 = show n ++ " bottles"

verse :: Int -> String
verse n = capitalizeStr $ h ++ t
          where
            h = bottles n ++ " of beer on the wall, " ++ bottles n ++ " of beer.\n"
            t = case n of
                  0 -> "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
                  otherwise -> "Take one down and pass it around, " ++ bottles (n-1)
                                ++ " of beer on the wall.\n\n"

main = putStr $ concat $ map verse [99,98..0]

capitalizeStr :: String -> String
capitalizeStr []     = []
capitalizeStr (x:xs) = [toUpper x] ++ xs
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

And a brief description, because that's all it needs.  First, import `Data.Char`, because we'll need it later, then define out `bottles` function.  While this may look like an overloaded function I'm just going to say: it's not; but either way, it defines the behavior of what to do when we have `n` bottles (whether bottles be positive or negative, but having negative bottles of beer is more sad than no bottles of beer, so we shan't think of that).  Then, we have another function whose first line is strange:

```haskell
verse n = capitalizeStr $ h ++ t
```

I've got a function I don't define until later & two variables that come from where?  Well lets go backwards to figure this out...

  * First I've got `t` which only appears in the `where` block underneath.  What does it do?  It takes the variable `n` that got passed to `verse` and outputs the proper response based on how many bottles of beer we have.
  * Next we have the `++` operator, which is just list concatenation.
  * Then `h` which simply interpolates the value we get from our `bottles` function.
  * The `$` is kind of "group everything after this in a set of parenthesis" which is real useful & makes code look nicer, so `$ h ++ t` is pretty much just syntactic sugar for `(h ++ t)`
  * Lastly, `capitalizeStr` which is a function that is defined at the bottom of the code, out of the way.  It does what it says, it capitalizes a `String`.

Last, but most importantly, we have our `main` function, which puts it all together!  First (going from right-to-left) we have map, which takes a function, and a list, and outputs a list (of `String`s in this case).  That list of stings gets concatenated, and finally, the whole thing is printed to the console!  What is nice about the functional style of things is I simply told it *what* to do, not always *how* to do it.  Of course there is always **some** amount of tell the computer *how* to do things, but in a functional language there is a lot less of it.

----------

These are just a few examples of programming paradigms one can use.  If you want to learn more I suggest reading the [Wikipedia article](http://en.wikipedia.org/wiki/Programming_paradigm) for more information & links to some specifics.  Learning about different paradigms will make you a better programmer, even if you don't ever use a logic or functional programming language, because you can use those styles - where appropriate - and make your programs better, and more robust.  This includes using an object system in a functional language if that will work better...

----------
Now, just to twist your mind, go check out the Malbolge solution: <http://www.99-bottles-of-beer.net/language-malbolge-995.html>
