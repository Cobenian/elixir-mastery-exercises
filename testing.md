# Exercise 1

* Write tests for map, reduce, filter
  Answers: 
  [answers](https://github.com/MonkeyIsNull/fp/blob/master/test/fp_test.exs)

# Exercise 2

* Create a project called droid_social. It should have a function called _post_
  that takes a String. In turn it calls a module called DroidProtocol that has
  a function called _beep_. Post passes the string onto beep which in turn returns
  back the String "boop: " with the string appended to it. Test that it can do this.
  [answer](https://github.com/MonkeyIsNull/droid_social/blob/unmocked/test/droid_social_test.exs)

# Exercise 3

* Write a Doctest that does the same as Exercise 2
  [answer](https://github.com/MonkeyIsNull/droid_social/blob/doctest/test/droid_social_test.exs)


# Exercise 4

* Use meck to write a test that mocks out DroidProtocol so that it's never actually
  called. Only your mock is called.
  [answer](https://github.com/MonkeyIsNull/droid_social/blob/meckmock/test/droid_social_test.exs)

# Exercise 5

* Create a DroidApi modules. Use this module as a behaviour to ensure that the call
  to _beep_ really takes a string and returns a string. Also see if you can use
  a dev instance of a MockDroidProtocol, load that instead of the regular DroidProtocol.
  If you finish that, create some more tests using tags.
  [answer](https://github.com/MonkeyIsNull/droid_social/tree/contract)
