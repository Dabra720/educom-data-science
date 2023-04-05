--6.3.2 Selecteer de namen van de eerste 25 leveranciers met HTML-teken in hun naam, met de vervanging van deze tekens door het juiste speciale teken.

-- De volgende functie aangemaakt:
-- https://stackoverflow.com/questions/3678980/is-there-a-mysql-function-to-decode-html-entities

-- SELECT HTML_UnEncode('this is a &lt;a&gt;test, nothing more');

SELECT name,
HTML_UnEncode(name) nice_name
FROM mhl_suppliers
WHERE name LIKE '%&%;%'
ORDER BY name
LIMIT 25