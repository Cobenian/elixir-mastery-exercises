## Exercise 1

Run `elixir cats.exs` to make a directory structure that looks like this:

cats/virginia/felix.cat
cats/virginia/angel.cat
cats/virginia/midnight.cat
cats/maryland/pepper.cat
cats/maryland/oreo.cat
cats/dc/tiger.cat
cats/dc/garfield.cat
cats/dc/misty.cat


Start a process that looks for "cats" (Cats are files...) in a
"state" (States are directories).

Whenever a message arrives looking for a cat, return the content of the file
matching the name of the cat.  Send it a message with a valid cat name. Send
it a message with an invalid cat name.

Assume the file exists and let it "crash" if it does not.

[Answer](https://gist.github.com/brweber2/56e9a991b023f8b46518e6389b79ce44)
