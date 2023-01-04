(define (domain robo-doctor_2)
(:requirements :typing :negative-preconditions :fluents)
(:types robot person location box content carrier)
(:functions
    (capacity ?cr - carrier)
)
(:predicates
  (robot-at ?r - robot ?x - location)
  (carrier-at ?cr - carrier ?x - location)
  (carrier-has ?cr - carrier ?b - box)
  (content-at ?c - content ?x - location)
  (box-at ?b - box ?x - location)
  (box-contains ?b - box ?c - content)
  (person-at ?p - person ?x - location)
  (person-has ?p - person ?c - content)
  (box-full ?b - box)
  )

(:action fill
    :parameters (?r - robot ?b - box ?c - content ?x - location)
    :precondition (and  (robot-at ?r ?x)
                        (box-at ?b ?x)
                        (content-at ?c ?x)
                        (not(box-full ?b)))
    :effect (and        (box-full ?b)
                        (box-contains ?b ?c)))

(:action load
    :parameters (?r - robot ?x - location ?b - box ?cr - carrier)
    :precondition (and  (robot-at ?r ?x)
                        (box-at ?b ?x)
                        (> (capacity ?cr) 0))
    :effect (and        (carrier-has ?cr ?b)
                        (not(box-at ?b ?x))
                        (decrease (capacity ?cr) 1)))

(:action move
    :parameters (?r - robot ?cr - carrier ?x1 - location ?x2 - location)
    :precondition (and  (robot-at ?r ?x1)
                        (not(robot-at ?r ?x2))
                        (carrier-at ?cr ?x1)
                        (not(carrier-at ?cr ?x2)))
    :effect (and        (robot-at ?r ?x2)
                        (not(robot-at ?r ?x1))
                        (carrier-at ?cr ?x2)
                        (not(carrier-at ?cr ?x1))))


(:action unload
    :parameters (?r - robot ?x - location ?b - box ?cr - carrier)
    :precondition (and  (robot-at ?r ?x)
                        (carrier-at ?cr ?x)
                        (carrier-has ?cr ?b))
    :effect (and        (box-at ?b ?x)
                        (increase (capacity ?cr) 1)
                        (not(carrier-has ?cr ?b))))

(:action empty
    :parameters (?r - robot ?x - location ?b - box ?c - content ?p - person)
    :precondition (and  (robot-at ?r ?x)
                        (box-at ?b ?x)
                        (box-contains ?b ?c)
                        (person-at ?p ?x))
    :effect (and        (not(box-contains ?b ?c))
                        (person-has ?p ?c)
                        (not(box-full ?b))))
)
