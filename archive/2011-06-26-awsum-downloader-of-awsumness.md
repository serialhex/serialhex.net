---
title: awsum downloader of awsumness
layout: post
date: 2011-06-26
---

### I HAVE DONE IT!!! ###
done what exactly?  i have made a spiffy program to automagically do BUNCHES of work for me.  see, i wanted to a bunch of images from a website, and downloading, renaming and saving all (103) files was going to be a pain in the ass.  so what did i do? i did what any self-respecting programmer would do: i wrote a program!  

ok, so it may not be the *coolest* program ever, or even nicely commented, or even error corrected, or hell, even error checking.  in fact it's more of a [kludge][] than a truly effective and versatile [program][].  and so i am here now (at almost 2am) to describe how i did it!  

[kludge]: http://en.wikipedia.org/wiki/Kludge
[program]: http://en.wikipedia.org/wiki/Computer_program

### it's a complete hack, but it works ###

yeah, so i hacked this thing together in ~1.5 hrs maybe more, but whatever.  so here is the code (with names changed to protect the innocent):

{% codeblock lang:ruby %}
#!/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'
require 'pry'

# gets webpages of links and such
puts "getting the main pages..."
docs = [] # i hate doing that
(1..6).each do |n|
  page = "http://sumwebsite.com/thing/stuff/moar/#{n}/"
  puts "-- getting page: #{page}"
  docs << Nokogiri::HTML(open(page))
end

# gets the objects 'm interested in'
puts "selecting stuff from the pages..."
stuff = [] # to keep this beotch in skope
docs.each do |doc|
  doc.search('div').each do |div|
    next unless (div['class'] == "product_grid_display")
    div.search('a').each do |a_tag|
      next unless (stuff << a_tag['href'])
    end
  end
end

# moar blokz!!
puts "getting the images..."
stuff.each do |page|
  puts "-- retreving from page: #{page}"
  file  = '' # makin things sure to stay in skope
  title = ''
  doc = Nokogiri::HTML(open(page)) # the previous one isn't in skope n e moar!!
  doc.search('div').each do |div|
    next unless (div['class'] == "imagecol")
    obj   = div.css('img') # searches fo krap
    title = obj[0].attributes['title'].text + ".jpg" # huzzah for chaining methods!!!
    img   = obj[0].attributes['src'].value
    open(img) do |info|
      File.open(title, "w") do |file|
        puts "-- saving: #{title}"
        file.write info.read
      end
    end
    # yeah, so far thi isn't very DRY at all.. in fact it's fucking WET!!!
  end
end
{% endcodeblock %}

*note: i __am__ going to fix the coloring... eventually.  for now read the [gist][]*  

[gist]: https://gist.github.com/1047294

so one of the first things you'll notice are my requires @ lines 3-6.  i used [nokogiri][] for all the parsing stuff i had to do, and since i've never used nokogiri before, i had a LOT of debugging & learning to do, so i used [pry][] *all. over. the. place.* like where??  like EVERY-FREAKING-WHERE when i was first writing this.  being able to `binding.pry` in my source & then `cd` & `ls -a` around and play with objects allowed me to figure out what methods, say `doc` had in line 20 (yeah, i stuck `binding.pry` right after the block there to figure out the right set of `doc.search('foo')` strings would work.)  

[nokogiri]: http://nokogiri.org/
[pry]: https://github.com/pry/pry

now, most of the code is kind of self explanatory, if you like reading a kludge and you're not doing that at 2:15am :P  so essentially it works like this:  

----

1.	get each of the webpages that have links to the stuff i'm interested in (that's the first block)

2.	from those pages, go into the `div class` thing that is equal to `"product_grid_display"`

3.	while in `"product_grid_display"` search for all links, and thow them in an array we'll use later

4.	then, *finally* get the images.  have a file name and title i'm going to store this stuff in (i could have probably taken them out of their initial scope, and left them in the inner block, but i'm lazy)

5.	search for the `div class` tag `"imagecol"` and then search for `img` tags, grab the title from the mouse-over text (origionally it was going to be the header text, but when i realized that the same text was here, i decided to grab it from here as it's one less block of code i'd have to write) and the actual image.

6.	then, `open` the image, and save it to a new `File` in the same dir as the script (yes, i am *very* lazy).

----

initially there was a lot of me going back and forth between [sublime text][] and my `binding.pry` instances, but eventually i got it working enough that i felt comfortable running it.  i did have one hiccup while running it for real: apparently my connection faltered and i couldn't grab a file, so it died (horribly) on me.  i simply ran it again and it went ahead and re-downloaded everything and i had no problems!  

[sublime text]: http://www.sublimetext.com/2

so now i feel all sorts of spiffy!!!  maybe this kludge will help someone else a bit.  

OH!!! AND I ALMOST FORGOT THE MOST IMPORTANT THING!!!  none of this would have been possible without google [chrome][] and it's spiffy `inspect element` thing in the right-click menu!!!  it allowed me to figure out which freaking `<div class="foo-fucking-bar">` thing that i had to go into in order to get the info i needed!  yes, chrome rocks, and if your not using it (or the open-source version [chromium][] which is what i'm actually using as theres no package for chrome on [archlinux][]) then u r LAME!!!!  unless you're on a mac, then you're maybe excused, but definitely not if you're on a mac using internet explorer... then you should be burned at the stake, alive, while on extacy to make it that much more excrutiating and long-lasting!!! (yes, i have no pity for M$)

[chrome]: http://www.google.com/chrome
[chromium]: http://www.chromium.org/Home
[archlinux]: http://www.archlinux.org/

p.s. i need to re-up my markdown skillz or something... or maybe my css/sass skillz...  yeah, probably the latter, and a little bit of the former, but what's even more important is sleep... so i shall do that now!!  

p.p.s i kind of like the black background on the code... i might change my whole wite to be like that... i dunno yet, we'll see.........
