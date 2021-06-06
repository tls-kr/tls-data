EXBIN=/home/chris/00scratch/eXist-db-4.5.0/bin
app="tls-data"
$EXBIN/client.sh -u admin -ouri=xmldb:exist://localhost:8080/exist/xmlrpc -x "file:sync('/db/apps/$app', '/home/chris/Dropbox/current/exist-apps/$app', xs:dateTime('2018-12-04T12:53:08.822+09:00'))"
