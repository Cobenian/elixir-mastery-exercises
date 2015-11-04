# Exercise 1

* Create a chat function that can send directly to a client.
  It doesn't go through the hub. The other client should be
  able to receive it and see the response. For example:
  ```iex(r2d2@panda)2> Client.chat("ig88", "sucka!")```
  and on ig88s side, it would display
  ```[r2d2@panda] sucka!```

* Instead of showing the pid number when a client connects
  have every connected client see the registered name of the client

* [Answer](https://github.com/MonkeyIsNull/hub/tree/answer)
