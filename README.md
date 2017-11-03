
= SQLcl Scripts and Notes

While SQLcl ships with a bash script 'sql', I have found it more reliable to create a custom script.

Sometimes the stock sql script finds the Oracle Java installation rather than my local java installaion, even when the local one is first in the PATH.

Ironically SQLcl will not work with the Java found in any current installations of Oracle, as SQLcl requires Java 1.8+


== Java Command Line

This is the default command line for a local Java found in PATH:

```java
java -Djava.awt.headless=true -Dapple.awt.UIElement=true -Xss10M -Djava.net.useSystemProxies=true -client -cp /usr/share/sqlcl/lib/extensions/*:/usr/share/sqlcl/lib/oracle.sqldeveloper.sqlcl.jar: oracle.dbtools.raptor.scriptrunner.cmdline.SqlCli 
```

== Security

I have been experimenting with haveged, /dev/random and /dev/urandom and how it can delay java logins.
(google this if unfamiliar with it)

To avoid possible delays in due to current state of these, I added the following to the command as I am not so concerned about Oracle security on this test box

```java
-Djava.security.egd=file:/dev/./urandom -Dsecurerandom.source=file:/dev/./urandom
```
The system I am working on never has any real data, and I am the only user.

The use of /dev/urandom is not really recommended for production use.

== Complete command

```java
java -Djava.security.egd=file:/dev/./urandom -Dsecurerandom.source=file:/dev/./urandom -Djava.awt.headless=true -Dapple.awt.UIElement=true -Xss10M -Djava.net.useSystemProxies=true -client -cp /usr/share/sqlcl/lib/extensions/*:/usr/share/sqlcl/lib/oracle.sqldeveloper.sqlcl.jar: oracle.dbtools.raptor.scriptrunner.cmdline.SqlCli 
```

== Bash Script sqlcl

```bash
#!/bin/bash

: 'COMMENT' <<-COMMENT

I have been experimenting with haveged, /dev/random and /dev/urandom and how it can delay java logins.
To avoid possible delays in due to current state of these, /dev/urandom specified on cmdline as I am not so concerned about Oracle security on this test box
ie. There is never any real data in any of the databases and no one but me has access

COMMENT

SQLCL_HOME='/usr/share/sqlcl'

java -Djava.security.egd=file:/dev/./urandom -Dsecurerandom.source=file:/dev/./urandom -Djava.awt.headless=true -Dapple.awt.UIElement=true -Xss10M -Djava.net.useSystemProxies=true -client -cp ${SQLCL_HOME}/lib/extensions/*:${SQLCL_HOME}/lib/oracle.sqldeveloper.sqlcl.jar: oracle.dbtools.raptor.scriptrunner.cmdline.SqlCli "$@"
```



