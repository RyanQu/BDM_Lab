#!/usr/bin/python
#Date: 2017.03.26
#Author: Ryan Qu
#Version: 1.0
#Description: The function to connect MySQL.
#Encoding: UTF-8

import cgi, cgitb
from mysqltest import connect_mysql

form = cgi.FieldStorage()
query = form.getvalue('query')

print "Content-type: text/html\n\n"

(results,attribute) = connect_mysql('localhost','root','RyanQ^94','utf8','bdmlab',query)

print '<!DOCTYPE html>\
<html lang="en">\
<head>\
<meta charset="utf-8">\
<title>BDM</title>\
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />\
<link rel="icon" href="/images/favicon.png">\
<link href="/bdm_lab/bootstrap/bootstrap.min.css" rel="stylesheet">\
<link href="/bdm_lab/fonts/font-awesome/css/font-awesome.css" rel="stylesheet">\
<link href="/bdm_lab/plugins/animate.css" rel="stylesheet">\
<link href="/bdm_lab/css/main.css" rel="stylesheet">\
<link href="/bdm_lab/highlight/styles/darkula.css" rel="stylesheet">\
</head>\
<body class="shadow">\
<div id="banner" class="banner">\
<div class="banner-search">\
<div class="container">\
<div class="row">\
<div class="col-md-10 col-md-offset-1" data-animation-effect="fadeIn">\
<div>\
<form class="" role="search" action="/cgi-bin/test.py">\
<div class="title">BDM Lab Exercise</div>\
<div class="subtitle">MySQL Query Web System</div>\
<div class="col-md-5 input-group">\
<input type="text" class="form-control" placeholder="Input your SQL query..." name="query">\
<span class="input-group-btn">\
<input class="btn btn-info" type="submit" value="Query">\
</span>\
</div>\
</form>\
</div>\
</div>\
</div>\
</div>\
</div>\
<div class="banner-result">\
<div class="container">\
<div class="row col-md-10 col-md-offset-1">\
<div class="subtitle">The query is</div>'

print '<pre class="hljs"><code class="sql hljs">%s</code></pre>' %query

print '</div>\
<div class="row">\
<div class="col-md-10 col-md-offset-1 over" data-animation-effect="fadeIn">\
<table class="table table-bordered table-condensed">\
<tr class="info" style="color:black">'

for i in attribute:
    print "<th>%s</th>" %i
print '</tr>'

for row in results:
    print '<tr class="warning" style="color:black">'
    for item in range(len(row)):
        print "<th>%s\t</th>" %row[item]
    print '</tr>'

print '</table>\
</div>\
</div>\
</div>\
</div>\
<div class="banner-caption-foot">\
<div class="container">\
<div class="row">\
<p class="text-center">Copyright &copy 2017 RyQ.</p>\
</div>\
</div>\
</div>\
</div>\
<script type="text/javascript" src="/bdm_lab/plugins/jquery.min.js"></script>\
<script type="text/javascript" src="/bdm_lab/bootstrap/bootstrap.min.js"></script>\
<script type="text/javascript" src="/bdm_lab/plugins/modernizr.js"></script>\
<script type="text/javascript" src="/bdm_lab/plugins/jquery.backstretch.min.js"></script>\
<script type="text/javascript" src="/bdm_lab/highlight/highlight.pack.js"></script>\
<script>hljs.initHighlightingOnLoad();</script>\
<script type="text/javascript" src="/bdm_lab/js/main.js"></script>\
</body>\
</html>'