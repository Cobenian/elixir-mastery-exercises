## Question 1

Run cats.exs to make a directory structure that looks like this:

cats/virginia/felix.cat
cats/virginia/angel.cat
cats/virginia/midnight.cat
cats/maryland/pepper.cat
cats/maryland/oreo.cat
cats/dc/tiger.cat
cats/dc/garfield.cat
cats/dc/misty.cat


Start a process that looks for "cats" (Cats are obviously files...) in a
"state" (States are obviously directories).

Whenever a message arrives looking for a cat, return the content of the file
with the name of the cat.  Assume the file exists and let it crash if it does not.
