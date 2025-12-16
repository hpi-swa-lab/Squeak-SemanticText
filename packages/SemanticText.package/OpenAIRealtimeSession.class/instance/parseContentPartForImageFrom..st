parsing
parseContentPartForImageFrom: json

	^ HtmlReadWriter new getImage: json image_url