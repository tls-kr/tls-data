xquery version "3.1";

(:~ This library module contains XQSuite tests for the sm-test app.
 :
 : @author Duncan Paterson
 : @version 0.8.0
 :)

module namespace tests="http://hxwd.org/apps/tls-data/tests";
import module namespace config="http://hxwd.org/apps/tls-data/config" at "config.xqm";
declare namespace test="http://exist-db.org/xquery/xqsuite";

declare variable $tests:hidden := $config:app-root || '/translations';
declare variable $tests:read-only := $config:app-root || '/concepts';

declare
  %test:name('translations should be invisible to user')
  %test:args('guest', 'guest')
  %test:assertError("java:org.xmldb.api.base.XMLDBException")
  %test:args('tls', 'tls')
  %test:assertError("java:org.xmldb.api.base.XMLDBException")
  function tests:out-of-sight($usr as xs:string, $pw as xs:string) as xs:boolean {
    system:as-user($usr, $pw, xmldb:get-child-resources($tests:hidden))
};

declare
  %test:name('translations should be admin only')
  %test:assertTrue
  function tests:reveal() as xs:boolean {
    exists($tests:hidden)
};

declare
  %test:name('user should not access translations')
  %test:args('tls', 'tls')
  %test:assertError
  function tests:no-doc($usr as xs:string, $pw as xs:string) as xs:string* {
      system:as-user($usr, $pw, doc($tests:hidden)//root/text())
};

declare
  %test:name('user should not write')
  %test:args('tls', 'tls')
  %test:assertError("java:org.xmldb.api.base.XMLDBException")
  function tests:no-write ($usr as xs:string, $pw as xs:string) as xs:string {
    let $doc := <root>test</root>
    return
      system:as-user($usr, $pw, xmldb:store($tests:read-only, 'test.xml', $doc))
};

declare
  %test:name('user should read')
  %test:args('tls', 'tls')
  %test:assertEquals(2971)
  function tests:read-only ($usr as xs:string, $pw as xs:string) as xs:integer {
    system:as-user($usr, $pw, count(xmldb:get-child-resources($tests:read-only)) )
};
