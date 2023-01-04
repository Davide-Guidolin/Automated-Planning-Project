(define (problem robo-doctor_4) (:domain robo-doctor_4)
(:objects 
    robot1                                              - robot
    person1 person2 person3 person4 person5 person6     - person
    depot loc1 loc2 loc3 loc4 loc5 loc6 loc7            - location
    box1 box2 box3 box4                                 - box
    xanax bendage banana pizza hammer                   - content
    carrier1                                            - carrier
    capacity_0                                          - capacity_number
    capacity_1                                          - capacity_number
    capacity_2                                          - capacity_number
    capacity_3                                          - capacity_number
    capacity_4                                          - capacity_number
)

(:init
    (capacity carrier1 capacity_4)
    (person-at person1 loc1)
    (person-at person2 loc3)
    (person-at person3 loc4)
    (person-at person4 loc7)
    (person-at person5 loc2)
    (person-at person6 loc6)
    (carrier-at carrier1 depot)
    (robot-at robot1 depot)
    (box-at box1 depot)
    (box-at box2 depot)
    (box-at box3 depot)
    (box-at box4 depot)
    (content-at xanax depot)
    (content-at bendage depot)
    (content-at banana depot)
    (content-at pizza depot)
    (content-at hammer depot)
    (capacity_predecessor capacity_0 capacity_1)
    (capacity_predecessor capacity_1 capacity_2)
    (capacity_predecessor capacity_2 capacity_3)
    (capacity_predecessor capacity_3 capacity_4)
    )

(:goal (and
    (person-has person1 hammer)
    (person-has person2 banana)
    (person-has person3 xanax)
    (person-has person3 hammer)
    (person-has person5 bendage)
    (person-has person6 bendage)
    (person-has person6 pizza)
    (person-has person6 xanax)
))
)
