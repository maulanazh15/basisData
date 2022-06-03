from random import random


import random

for i in range(22,43):
    for j in range(1,11) :
        print("INSERT INTO rating_makanan VALUES ('PBLI%d', 'MKN%d', %d);" % (j, i, random.randint(1, 5)))