"""
    gcd(a::Integer, b::Integer)::Integer

Calculates the greatest common divisor (GCD) of two integers using the Euclidean algorithm.
The Euclidean algorithm is based on the principle that the GCD of two numbers also divides their difference.

# Arguments
- `a::Integer`: The first integer.
- `b::Integer`: The second integer.

# Returns
- `Integer`: The greatest common divisor of `a` and `b`.

# Examples
```julia
julia> gcd(54, 24)
6  # Explanation: 6 is the largest number that divides both 54 and 24 without leaving a remainder.

julia> gcd(100, 75)
25  # Explanation: 25 is the largest number that divides both 100 and 75 without leaving a remainder.
"""
function gcd(a::Integer, b::Integer)::Integer
    while b != 0
        a, b = b, a % b # Update a and b where b becomes the remainder of a divided by b, and a takes the value of b.
    end
    return a # When b becomes 0, a is the GCD.
end

"""
    lcm(a::Integer, b::Integer)::Integer

Calculates the least common multiple (LCM) of two integers based on their greatest common divisor (GCD).
This method minimizes the risk of integer overflow by performing division before multiplication,
using the relationship that LCM of two numbers a and b is given by abs(a * b) / GCD(a, b).

# Arguments
- `a::Integer`: The first integer.
- `b::Integer`: The second integer.

# Returns
- `Integer`: The least common multiple of `a` and `b`.

# Examples
```julia
julia> lcm(4, 6)
12  # Explanation: 12 is the smallest number that both 4 and 6 can divide without leaving a remainder.

julia> lcm(21, 6)
42  # Explanation: 42 is the smallest number that both 21 and 6 can divide without leaving a remainder.
"""
function lcm(a::Integer, b::Integer)::Integer
    # Perform division first to reduce the risk of overflow:
    return (a // gcd(a, b)) * b
end

"""
    p_0005(n::Integer = 20)::Integer

Calculates the smallest multiple evenly divisible by all integers from 1 through n.
This is achieved by computing the least common multiple (LCM) of a series of numbers from 1 to n,
iteratively updating the LCM with each new integer. The computation starts with an initial value of 1, 
as 1 is the neutral element in multiplication and LCM operations.

# Arguments
- `n::Integer`: The upper limit of consecutive integers for which the LCM is calculated, defaulting to 20.

# Returns
- `Integer`: The smallest positive integer that is divisible by every number from 1 through n.

# Examples
```julia
julia> p_0005(10)
2520  # This is the smallest number divisible by all numbers from 1 to 10 without remainder.

julia> p_0005(20)
232792560  # This is the smallest number divisible by all numbers from 1 to 20 without remainder.
"""
function p_0005(n::Integer = 20)::Integer
    lcm_result = 1 # Start with 1, which is the LCM of any number with itself.
    # Loop over each number from 1 to n to compute the cumulative LCM.
    for i in 1:n
        lcm_result = lcm(lcm_result, i)  # Update the LCM with each new integer from 1 to n.
    end

    return lcm_result  # Return the computed LCM of all numbers from 1 to n.
end
