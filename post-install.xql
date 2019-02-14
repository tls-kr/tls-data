xquery version "3.0";

(: The following external variables are set by the repo:deploy function :)

(: file path pointing to the exist installation directory :)
declare variable $home external;
(: path to the directory containing the unpacked .xar package :)
declare variable $dir external;
(: the target collection into which the app is deployed :)
declare variable $target external;

(: Limit access to translations if available :)
declare function local:proc($uri as xs:string, $perm as xs:string)
{ 
  sm:chmod(xs:anyURI($uri), $perm),
  sm:chgrp(xs:anyURI($uri), "tls-user"),
  sm:chown(xs:anyURI($uri), "tls"),

for $u in xmldb:get-child-collections($uri)
let $t := $uri || "/" || $u
return 
  local:proc($t, $perm)
  ,
for $u in xmldb:get-child-resources($uri)
let $t := $uri || "/" || $u
return
(
  sm:chmod(xs:anyURI($t), $perm),
  sm:chgrp(xs:anyURI($t), "tls-user"),
  sm:chown(xs:anyURI($t), "tls")
)
};

(
(: world can not read translations :)
local:proc($target || "/translations", "rwxrwx---"),

(: world can read but not write :)
local:proc($target || "/concepts", "rwxrwxr--"),
local:proc($target || "/core", "rwxrwxr--"),
local:proc($target || "/notes", "rwxrwxr--"),
)


