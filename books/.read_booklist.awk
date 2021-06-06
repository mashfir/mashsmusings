#!/usr/bin/env awk -f
BEGIN {
  FS="\t"
  OFS=""

  printf "<!DOCTYPE html>\n\
<html>\n\
<head>\n\
<meta charset=\"UTF-8\" />\n\
<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n\
<title>Mash's Readings</title>\n\
<link href=\"/style.css\" rel=\"stylesheet\" type=\"text/css\" media=\"all\" />\n\
</head>\n\
<body>\n\
<div id=\"heading\">\n\
<h3>Mash's Musings</h3>\n\
<ul class=\"topnav\">\n\
<li><a href=\"/\">Musings</a></li>\n\
<li><a href=\"/books\">Readings</a></li>\n\
</ul>\n\
</div>\n\
<hr />\n\
<div id=\"preamble\">\n\
<p>\n\
Having shared booklists with a few people through the inconvenient method of copy-pasting from my to-do app, I figured it easiest to just dump everything I've read here for now. Feel free to reach out to discuss anything that you find interesting. Books are listed in roughly chronological order.\n\
</p>\n\
</div>\n\
"
  printf("<h4>Updated %s</h4>\n", strftime("%b. %-d, %Y"))
}
{
  title=$1
  author=$2
  category=$3
  read=$4
  if (read=="true") {
    i++
    books[i]="<li><em>" title "</em>. " author ".</li>"
  }
}
END {
  printf "<div id=\"list\">\n<ul>"
  for (i in books) {
    print books[i]
  }
  printf "</ul>\n</div>\n"
  printf "</body>\n</html>"
}
