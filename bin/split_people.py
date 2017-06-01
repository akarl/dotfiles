import random

people = [
    'andreas',
    'sebastian',
    'anton',
    'william',
    'vera',
    'adam',
    'erik',
    'camille',
    'evy',
]

random.shuffle(people)
group1 = []
group2 = []

while len(people) != 0:
    if len(people):
        group1.append(people.pop())
    if len(people):
        group2.append(people.pop())

print(group1)
print(group2)
