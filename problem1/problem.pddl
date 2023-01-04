(define (problem robo-doctor_1) (:domain robo-doctor_1)
(:objects 
    robot1                                  - robot
    person1 person2 person3                 - person
    depot loc1 loc2 loc3 loc4               - location
    box1 box2                               - box
    medicine food tool                      - content
)

(:init
    (person-at person1 loc1)
    (person-at person2 loc3)
    (person-at person3 loc4)
    (robot-at robot1 depot)
    (box-at box1 depot)
    (box-at box2 depot)
    (content-at medicine depot)
    (content-at food depot)
    (content-at tool depot)
)

(:goal (and
    (person-has person1 tool)
    (person-has person2 medicine)
    (person-has person3 food)
    (person-has person3 medicine)
))
)
