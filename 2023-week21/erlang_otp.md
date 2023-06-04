## [Erlang OTP](https://www.erlang.org/doc/design_principles/des_princ.html)
* supervisor
* worker
  * servers in a server-client relation
  * finite-state machine
  * event handler
* Behaviour
  * divide the code for a process in a generic part (a behaviour module) and a specific part (a `callback module`)

* gen_server Behaviour
  * 