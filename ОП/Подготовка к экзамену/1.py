from sys import getsizeof
a = [0 for i in range(3)]
b = [0]+[0]+[0]

print getsizeof(a), getsizeof(b)
print a, b
a[0] = 1
b[0] = 1
print a, b
print getsizeof(a), getsizeof(b)
