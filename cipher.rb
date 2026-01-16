# Idea: Convert string to array.
# Convert all strings to integers.
# Identify ranges in ASCII. A: 65, Z:90. a: 97, z: 122
# If number in range 65 to 90, subtract 65, then add shift, mod by 26, add 65
# If number in range 97 to 122, subtract 97, add shift, mod by 26, add 97.
# Convert all ints back to char
# Join into string for return 