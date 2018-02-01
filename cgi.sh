#!/bin/sh

domain="7e2f.org"
#footer_left=$SERVER_SOFTWARE
footer_left=$DOCUMENT_ROOT+$REQUEST_URI
footer_right="ch at ~/ . org"

if [[ $REQUEST_URI != "/" ]]
    then
        cgi_request=$REQUEST_URI
    else
        cgi_request="/index.sh"
fi

[[ -f $HTTP_HOST$cgi_request ]] && . $HTTP_HOST$cgi_request

cat << EOF
Content-Type: text/html

<html>
<head>
	<meta charset='utf-8'>
	<title>~/$title</title>
	<link rel='stylesheet' type='text/css' href='/style.css'>
</head>
<body>
	<div id='container'>
		<div id='nav'>
			<span class='left'>
				~/$title
        		</span>
			<span class='right'>
				<a href='//$domain'>home</a>
				<a href='//start.$domain'>start</a>
				<a href='//radio.$domain'>radio</a>
				<a href='//pass.$domain'>pass</a>
				<a href='//cloud.$domain'>cloud</a>
				<a href='//code.$domain'>code</a>
			</span>
		</div>

		<div id='content'>
			$content
		</div>
		<div id='footer'>
			<span class='left'>
				$footer_left
			</span>
			<span class='right'>
				$footer_right
			</span>
		</div>
	</div>


</body>
</html>

EOF
