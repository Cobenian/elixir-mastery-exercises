# Exercise 1
* Given the data below, write a function that pulls the _uniq_  first word
  items out of the fifth field. You should get back
  ```
  ["Open", "Asset", "Core", "Xcode", "_launchservicesd"]
  ```

```
admin:*:231:-2:Open Directory Kerberos Admin Service:/var/empty:/usr/bin/false
_krb_changepw:*:232:-2:Open Directory Kerberos Change Password Service:/var/empty:/usr/bin/false
_krb_kerberos:*:233:-2:Open Directory Kerberos:/var/empty:/usr/bin/false
_krb_anonymous:*:234:-2:Open Directory Kerberos Anonymous:/var/empty:/usr/bin/false
_assetcache:*:235:235:Asset Cache Service:/var/empty:/usr/bin/false
_coremediaiod:*:236:236:Core Media IO Daemon:/var/empty:/usr/bin/false
_xcsbuildagent:*:237:237:Xcode Server Build Agent:/var/empty:/usr/bin/false
_xcscredserver:*:238:238:Xcode Server Credential Server:/var/empty:/usr/bin/false
_launchservicesd:*:239:239:_launchservicesd:/var/empty:/usr/bin/false
```

[answer](https://github.com/MonkeyIsNull/fpexer/blob/master/test/fpexer_test.exs)

# Exercise 2

* Given the following data, write a function called find_by_type.
  Use it to find all droids, then use it find all humans. Use recursion to do this.
  [answer](https://github.com/MonkeyIsNull/fpexer/blob/master/lib/fpexer.ex)

```
characters = [
  %{name: "Han",        type: :human,   rebel: true,    weight: 185},
  %{name: "Jabba",      type: :hutt,    rebel: false,   weight: 2200},
  %{name: "Chewie",     type: :wookie,  rebel: true,    weight: 350},
  %{name: "r2d2",       type: :droid,   rebel: true,    weight: 250},
  %{name: "Luke",       type: :human,   rebel: true,    weight: 140},
  %{name: "Boba Fett",  type: :human,   rebel: false,   weight: 175},
]
```

# Exercise 3 

* Without looking at the slides, code the implementation for map, filter and reduce.
  Wikipedia has implementations that are close so you can use those if you're stuck. Reduce is also called fold.
  Answers: slides 

