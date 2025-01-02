type state = int32
module StateSet : Set.S with type elt = int32
module CharMap : Map.S with type key = string
type transitions = StateSet.t CharMap.t

type nfa = {
  start : StateSet.t;
  (** the start states *)

  finals: StateSet.t;
  (** the final (or "accept") states *)

  next: state -> transitions;
  (** the transition function, that maps a state and a character to a
      set of states *)
}

(* TODO, the type string list is actually not correct. *)
val accept : nfa -> string list -> bool
(** [accept nfa l] is [true] iff the nfa [nfa] accepts the
    character sequence [l] *)
