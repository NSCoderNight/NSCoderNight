# NSCoderNight

Welcome to the GitHub repository for the <a href="http://www.nscodernight.com">NSCoderNight website</a>.

The <a href="https://github.com/nscodernight/nscodernight/tree/master">master</a> branch is for the files that are fed in to the <a href="https://middlemanapp.com">Middleman</a> static site generator framework by our <a href="https://travis-ci.org/NSCoderNight/NSCoderNight">Travis CI continuous build system</a>.

The <a href="https://github.com/nscodernight/nscodernight/tree/gh-pages">gh-pages</a> branch is for the results of the static generation, and contains only the files for the actual website.

The information for chapters is in the top-level <a href="https://github.com/NSCoderNight/NSCoderNight/tree/master/chapters">chapters</a> folder on the master branch.

Each chapter has its own file, whose name is a lowercase version of the chapter name, with dashes instead of spaces. For example: "san-francisco.yaml" for the San Francisco branch. Dashes also convert to dashes, so Raleigh-Durham corresponds to "raleigh-durham.yaml".

The first line of each yaml file must only have three dashes in it.

Subsequent lines are in a key/value format, where the key is at the beginning of the line followed by a colon and a space, the the value takes up the rest of the line.

Here are the currently allowed keys:

<b>name:</b> name of the chapter. By custom, this is usually the main city of the chapter. It is required, and must correspond to the file name as specified above, or links to the chapter web page from the rest of the site won't work.

<b>organizer_name</b>, <b>organizer_twitter</b>, <b>organizer_website</b>: information about the organizer. Optional. Currently only one organizer may be listed.

<b>twitter</b>, <b>website</b>: Internet accounts for the chapter.

<b>province</b>, <b>country</b>: Geographical information for the chapter. Country is required and is used for the chapter categories in the chapter list. Therefore, please be consistent and use the same country name as other existing chapters, such as "USA". Province should only be included for the United States or other countries where there are many chapters. For the U.S., it should be the two-letter state code.

<b>day</b>, <b>meeting_time</b>: if these are missing, the chapter day will be reported as being Every Tuesday, and the time 7:00 p.m. - 10:00 p.m.

<b>location</b>: this is the only multi-line value. By custom, the first line is just a pipe character (|), and subsequent lines have the real information, indented one tab. Also by custom, the first line is the name of the establishment used for the meeting, and is a link to the location, either the establishment's website, or a Google maps link to the address. Subsequent lines are the rest of the address. You can leave off city and state if it's the same as the chapter.

If all this seems complicated, don't worry! There are plenty of example chapter files you can look at for guidance. At worst, just put together what you can in a branch, and we'll fix in in the pull request.