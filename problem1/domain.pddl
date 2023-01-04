(define (domain robo-doctor_1)
 (:requirements :typing :negative-preconditions)
 (:types robot person location box content)

(:predicates
  (robot-at ?r - robot ?x - location)
  (robot-has ?r - robot ?b - box)
  (content-at ?c - content ?x - location)
  (box-at ?b - box ?x - location)
  (box-contains ?b - box ?c - content)
  (person-at ?p - person ?x - location)
  (person-has ?p - person ?c - content)
  (robot-loaded ?r - robot)
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
    :parameters (?r - robot ?x - location ?b - box)
    :precondition (and  (robot-at ?r ?x)
                        (box-at ?b ?x)
                        (not(robot-loaded ?r)))
    :effect (and        (robot-loaded ?r)
                        (robot-has ?r ?b)
                        (not(box-at ?b ?x))))

(:action move
    :parameters (?r - robot ?x1 - location ?x2 - location)
    :precondition (and  (robot-at ?r ?x1)
                        (not(robot-at ?r ?x2)))
    :effect (and        (robot-at ?r ?x2)
                        (not(robot-at ?r ?x1))))


(:action unload
    :parameters (?r - robot ?x - location ?b - box)
    :precondition (and  (robot-at ?r ?x)
                        (robot-has ?r ?b))
    :effect (and        (box-at ?b ?x)
                        (not(robot-loaded ?r))
                        (not(robot-has ?r ?b))))

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
