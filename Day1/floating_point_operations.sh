#1.

#!/bin/bash

a=1.5
b=4.5

# Add
c=$(echo "scale=2; $a + $b" | bc)
echo "Addition: $a + $b = $c"

# Sub
d=$(echo "scale=2; $a - $b" | bc)
echo "Subtraction: $a - $b = $d"

# Multiply
e=$(echo "scale=2; $a * $b" | bc)
echo "Multiplication: $a * $b = $e"

# Divide
f=$(echo "scale=2; $a / $b" | bc)
echo "Division: $a / $b = $f"
