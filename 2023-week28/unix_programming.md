# [Input/Output Multiplexing](https://ocaml.github.io/ocamlunix/ocamlunix.html#sec115)

- Scenario (multi-windowed terminal emulator)
  - a client is connect to a server on a serial port (a special file /dev/ttya)
  - the client is using a emulated terminal with multiple windows
  - each "windows" corresponds a user process in the server
  - multiple user processes

- Demultiplexing (1 to N)
  - transmission from the client to the user processes
- Multiplexing (N to 1)
  - transmission from the user processes to client
