---
title: continued fractions
---

I recently received a (beta) copy of [Good Math](http://pragprog.com/book/mcmath/good-math) and one of the  cool things I read about was [continued fractions](http://en.wikipedia.org/wiki/Continued_fraction)!  They are interesting enough that I want to sharpen my Haskell skillz with them.

What *is* a continued fraction you ask?  Well, they look something like this:

$3\frac{49}{200} = 3 + \frac{1}{4 + \frac{1}{12 + \frac{1}{4}}}$

but that isn't very helpful as you can't really compute with something like that.  So they are typically represented like this: [3;4,12,4].

From here on out, I'm just gonna write me some raw Haskell code, and explain that as well as I can.  If you are interested, just hit up the [Wikipedia page](http://en.wikipedia.org/wiki/Continued_fraction).

Okay, first things first:

\begin{code}
import Data.Ratio

data ContinuedFraction = ContinuedFraction [Integer]
\end{code}

This imports the Ratio module, and sets up the basic data type for us.  I chose `[Integer]` because the numbers can become arbitrarily large.

\begin{code}
toContinuedFraction :: Ratio Integer -> ContinuedFraction
toContinuedFraction i
        | i == 1      = ContinuedFraction [1]
        | otherwise   = ContinuedFraction $ moarFrac i
        where
            moarFrac 1 = []
            moarFrac r = i :  if r' /= 0
                              then moarFrac $ recip r'
                              else []
              where i = (floor r)
                    r' = r - toRational i
\end{code}

adding & subtracting & multiplying & dividing: http://www.tweedledum.com/rwg/cfup.htm
