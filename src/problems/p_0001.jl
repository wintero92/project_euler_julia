"""
    sum_divisible(multiple::Integer, divisor::Integer)::Integer

Calculate the sum of all integers up to and including `multiple` that are divisible by `divisor`. This function employs the formula for the sum of an arithmetic sequence, which ensures that the computation is efficient and direct.

# Arguments
- `multiple::Integer`: The upper limit (inclusive) of the range within which to find numbers divisible by `divisor`.
- `divisor::Integer`: The number by which other numbers must be divisible.

# Returns
- `Integer`: The sum of all numbers up to `multiple` that are divisible by `divisor`.

# Examples
```julia
julia> sum_divisible(10, 2)
30  # Explanation: 2 + 4 + 6 + 8 + 10 = 30

julia> sum_divisible(20, 3)
63  # Explanation: 3 + 6 + 9 + 12 + 15 + 18 = 63
"""
function sum_divisible(multiple::Integer, divisor::Integer)::Integer
    # Calculate the number of terms divisible by 'divisor' up to 'multiple'
    p = fld(multiple, divisor)
    # Use the arithmetic series sum formula: n/2 * (first term + last term)
    # Here, the first term is 'divisor', and the last term is 'divisor * p'
    return fld(divisor * p * (p + 1), 2)
end

"""
    p_0001(below::Integer = 1000)::Integer

Calculate the sum of all natural numbers below a specified limit that are multiples of either 3 or 5. The function corrects for numbers that are multiples of both 3 and 5 by subtracting the sum of multiples of 15, thereby ensuring such numbers are only counted once.

# Arguments
- `below::Integer`: The upper limit (exclusive) up to which to sum the multiples. Default is 1000.

# Returns
- `Integer`: The sum of all numbers below `below` that are multiples of either 3 or 5, adjusted for double-counting.

# Examples
```julia
julia> p_0001(10)
23  # Explanation: 3 + 5 + 6 + 9 = 23

julia> p_0001(20)
78  # Explanation: 3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 = 78
"""
function p_0001(below::Integer = 1000)::Integer
    # Calculate the sum of multiples of 3 below the given limit
    sum_3 = sum_divisible(below - 1, 3)
    # Calculate the sum of multiples of 5 below the given limit
    sum_5 = sum_divisible(below - 1, 5)
    # Calculate the sum of multiples of 15 below the given limit
    sum_15 = sum_divisible(below - 1, 15)
    # Apply the inclusion-exclusion principle to correct for double-counted multiples of both 3 and 5
    return sum_3 + sum_5 - sum_15
end
