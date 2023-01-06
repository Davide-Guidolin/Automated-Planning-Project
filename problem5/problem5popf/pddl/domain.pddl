(define (domain robo-doctor_5)
(:requirements :typing :durative-actions)
(:types robot person location box content carrier capacity_number)

(:predicates
    (capacity ?cr - carrier ?cp - capacity_number)
    (capacity_predecessor ?cp_prev - capacity_number ?cp_succ - capacity_number)
    (robot_at ?r - robot ?x - location)
    (carrier_at ?cr - carrier ?x - location)
    (carrier_has ?cr - carrier ?b - box)
    (content_at ?c - content ?x - location)
    (box_at ?b - box ?x - location)
    (box_contains ?b - box ?c - content)
    (person_at ?p - person ?x - location)
    (person_has ?p - person ?c - content)
    (box_full ?b - box)
    (box_empty ?b - box)
    (busy ?r - robot)
    (free ?r - robot)
    )

(:durative-action fill
    :parameters (?r - robot ?b - box ?c - content ?x - location)
    :duration (= ?duration 5)
    :condition (and     (over all(robot_at ?r ?x))
                        (over all(box_at ?b ?x))
                        (over all(content_at ?c ?x))
                        ;(at start (not(busy ?r)))
                        (at start (free ?r))
                        ;(at start(not(box_full ?b)))
                        (at start(box_empty ?b)))
    :effect (and        ;(at start(box_full ?b))
                        (at start(not(box_empty ?b)))
                        ;(at start(busy ?r))
                        (at start(not(free ?r)))
                        ;(at end (not (busy ?r)))
                        (at end (free ?r))
                        (at end (box_contains ?b ?c))))

(:durative-action load
    :parameters (?r - robot ?x - location ?b - box ?cr - carrier ?cp_prev - capacity_number ?cp_succ - capacity_number)
    :duration (= ?duration 4)
    :condition (and     (over all(robot_at ?r ?x))
                        (at start(box_at ?b ?x))
                        ;(at start (not(busy ?r)))
                        (at start (free ?r))
                        (over all(capacity_predecessor ?cp_prev ?cp_succ))
                        (at start(capacity ?cr ?cp_succ)))
    :effect (and        (at end(carrier_has ?cr ?b))
                        ;(at start (busy ?r))
                        (at start(not(free ?r)))
                        (at end (free ?r))
                        ;(at end(not(busy ?r)))
                        (at start(not(box_at ?b ?x)))
                        (at start(not(capacity ?cr ?cp_succ)))
                        (at start(capacity ?cr ?cp_prev))))

(:durative-action move
    :parameters (?r - robot ?cr - carrier ?x1 - location ?x2 - location)
    :duration (= ?duration 10)
    :condition (and     ;(at start(not(busy ?r)))
                        (at start (free ?r))
                        (at start(robot_at ?r ?x1))
                        ;(at start(not(robot_at ?r ?x2)))
                        ;(at start(not(carrier_at ?cr ?x2)))
                        (at start(carrier_at ?cr ?x1)))
    :effect (and        ;(at start(busy ?r))
                        ;(at end(not(busy ?r)))
                        (at start(not(free ?r)))
                        (at end (free ?r))
                        (at end(robot_at ?r ?x2))
                        (at start(not(robot_at ?r ?x1)))
                        (at end(carrier_at ?cr ?x2))
                        (at start(not(carrier_at ?cr ?x1)))))


(:durative-action unload
    :parameters (?r - robot ?x - location ?b - box ?cr - carrier ?cp_prev - capacity_number ?cp_succ - capacity_number)
    :duration (= ?duration 2)
    :condition (and     (at end(robot_at ?r ?x))
                        (at end(carrier_at ?cr ?x))
                        (at start(carrier_has ?cr ?b))
                        (over all(capacity_predecessor ?cp_prev ?cp_succ))
                        (at start(capacity ?cr ?cp_prev))
                        )
    :effect (and        (at end(box_at ?b ?x))
                        (at start(capacity ?cr ?cp_succ))
                        (at start(not(capacity ?cr ?cp_prev)))
                        (at start(not(carrier_has ?cr ?b)))))

(:durative-action empty
    :parameters (?r - robot ?x - location ?b - box ?c - content ?p - person)
    :duration (= ?duration 3)
    :condition (and     (over all (robot_at ?r ?x))
                        (at start (free ?r))
                        (over all(box_at ?b ?x))
                        (at start(box_contains ?b ?c))
                        (over all(person_at ?p ?x)))
    :effect (and        ;(at start (busy ?r))
                        (at start (not(free ?r)))
                        (at end (free ?r))
                        ;(at end (not (busy ?r)))
                        (at end(not(box_contains ?b ?c)))
                        (at end(person_has ?p ?c))
                        (at end(box_empty ?b))))
)