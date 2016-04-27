## Exercise 1

* Clone the [Hub repo](https://github.com/MonkeyIsNull/hub/tree/master) and run the examples from the slide, ensure you understand how it works

## Exercise 2

* Modify the Hub project and create a chat function that can send directly to a client.
  It doesn't go through the hub. The other client should be
  able to receive it and see the response. For example:
  ```iex(r2d2@panda)2> Client.chat("ig88", "imperial scum!")```
  and on ig88s side, it would display
  ```[r2d2@panda] imperial scum!!```

* Instead of showing the pid number when a client connects
  have every connected client see the registered name of the client

* [Answer](https://github.com/MonkeyIsNull/hub/tree/answer)
