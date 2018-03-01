# NSCoderNight

Welcome to the GitHub repository for the <a href="http://nscodernight.com">NSCoderNight website</a>.

<h3>Branches</h3>
The <a href="https://github.com/nscodernight/nscodernight/tree/master">master</a> branch is for the files that are fed in to the <a href="https://middlemanapp.com">Middleman</a> static site generator framework by our <a href="https://travis-ci.org/NSCoderNight/NSCoderNight">Travis CI continuous build system</a>. If you clone this repository or create your own branch, do it off of here.

The <a href="https://github.com/nscodernight/nscodernight/tree/gh-pages">gh-pages</a> branch is for the results of the static generation, and contains only the files for the actual website. This branch should be left alone.

<h3>Adding or Editing a Chapter</h3>
If you want to add a new chapter, or edit an existing chapter, please clone this repository (if you're not a contributor) or create a branch (if you are) and submit a pull request.

<h4>Chapter Files</h4>
Chapter files are located in the top-level [chapters](chapters) folder on the master branch.

Each chapter has its own file, whose name is a lowercase version of the chapter name, with dashes instead of spaces. For example: "san-francisco.yaml" for the San Francisco branch. Dashes also convert to dashes, so Raleigh-Durham corresponds to "raleigh-durham.yaml".

<h4>Chapter File Format</h4>
Here is a sample chapter file, called my-city.yaml.

````
---
name: My City
organizers:
  - name: Valerie Davies
    twitter: v_davies
  - name: Elon Deforest
    website: http://www.eforest.com
twitter: MyCity
website: http://nscodernightmycity.com
meetings:
  - name: West End
    start_time: '19:00'
    location: |
        <a href="http://www.yelp.com/biz/west-end-cafe">West End Cafe</a>
        125 Westerly Road
  - name: East End
	day: Every Tuesday
    start_time: 7:00 p.m.
    end_time: 10:00 p.m.
    location: |
        <a href="http://www.yelp.com/biz/east-end-cafe">East End Cafe</a>
        521 Easterly Road
province: MN
country: USA
````
Each chapter file must start with three dashes follow by a return.

The <B>name</B> field is required and, as described above, must correspond to the filename.

The <B>organizers</B> field describes the one or more organizers of your chapter. If there is no organizer, leave out the <B>organizers</B> field entirely.

Each organizer should have a <B>name</B> field and may have <B>twitter</B>, <B>website</B>, <B>email</B>, and <B>phone</B> fields. The Twitter, website, and email fields are turned into links. Email is not currently obfuscated in any way. Put each of these fields on their own line after the organizers line, indented 4 spaces. For the <I>first</I> field of an organizer, the third space should instead be a dash.

You can have as many organizers as you want, and they will be listed in the order they appear in this file.

The <B>twitter</B> and <B>website</B> fields are for the chapter as a whole, and are optional. If you have more than one URL for the chapter, you can instead use the <B>websites</B> field, like so:

````
websites:
	- http://website1.com
	- http://website2.org
	- http://website3.io
````
The <B>meetings</B> field describes the one or more meetings of your chapter, is, just like the <B>organizers</B> field describes multiple organizers. The format is the same.

The meeting <b>name</b> name field is optional. Don't use if your chapter has only one meeting; instead, use it to distinguish between multiple meetings.

The meeting <b>day</b> field is optional, but if it is missing, the text "Every Tuesday" will be used.

The meeting <b>start_time</b> and <b>end_time</b> fields are optional. If both are missing, "7:00 p.m." and "10:00 p.m." are used, respectively, for your meeting time.

If <b>start_time</b> is present but <b>end_time</b> is missing, then only the beginning time of your meeting will be displayed.

Also note, due to a peculiarity of our build system, if you use a time without a trailing "a.m." or "p.m.", such 19:00, you will need to put that text in single quotes or it will not be displayed incorrectly.

The meeting <b>location</b> field is the only multi-line value. The first line of such a multi-line value must be just a pipe character (|). Subsequent lines must be indented four more spaces. 

Also by custom, the first line is the name of the establishment used for the meeting, and is a link to the location, either the establishment's website, or a Google maps link to the address. Subsequent lines are the rest of the address. You can leave off city and state if it's the same as the chapter.

The <b>province</b> and <b>country</b> fields are the geographical information for the chapter. Country is required and is used for the chapter categories in the chapter list. Therefore, please be consistent and use the same country name as other existing chapters, such as "USA". Province should only be included for the United States or other countries where there are many chapters. For the United States, it should be the two-letter state code.

Please look at the existing chapter files for reference. Feel free to <a href="mailto:nscodernight@gmail.com">email us</a> or open a GitHub issue if you have any questions.
