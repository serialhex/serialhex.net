---
title: coding & teaching with friends
---

I'm sitting here with my friends, and one of them wants me to help him with some programming.  My friend Justin wants to learn a language that he can make money with once he learns it, so I suggested Javascript, even though I'm not particularly fond of it.  My friend James suggested that as a first exercise, Justin create an array, and then write a function to sort it.  I liked that idea, and as the teacher, I have to be able to do that myself.  So here it is:  

~~~~~ {#code .javascript .numberLines}
var arr = [8,6,7,5,3,0,9];

var myBubbleSort = function (array) {
  var arrChanged = false;
  do {
    arrChanged = false;
    for (var i = 0; i < (array.length - 1); i++) {
        if (array[i] > array[i+1]) {
            var t = array[i+1];
            array[i+1] = array[i];
            array[i] = t;
            arrChanged = true;
        }
    }
  } while (arrChanged);
  return array;
}

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

I unfortunately had problems with writing this.  Not that a bubble sort is particularly hard or anything.  No, my problem was i forgot line 6 - changing the `arrayChanged` to `false`.  I blame this on the  fact that in Haskell, you don't need to do stuff like that because, well, you don't have loops in Haskell like you do in most other languages.  For example, I shall write me a bubble sort in Haskell:  


~~~~~ {#code .haskell .numberLines}
arr = [8,6,7,5,3,0,9]

myBubbleSort :: [Integer] -> [Integer]
myBubbleSort []     = []
myBubbleSort (x:xs) = sorting [] x xs
  where
    sorting (l:ls) x (r:[]) = if x <= r
                              then (sorting [] l (ls ++ [x]) ) ++ [r]
                              else (sorting [] l (ls ++ [r]) ) ++ [x]
    sorting ls x (r:rs)     = if x <= r
                              then sorting (ls ++ [x]) r rs
                              else sorting (ls ++ [r]) x rs
    sorting ls x _           = ls ++ [x]

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This took some trying also, but mostly because bubblesort is a very stateful algorithm, though it's not too hard to figure out a way to deal with that.
