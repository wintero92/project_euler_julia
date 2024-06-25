"""
    sum_divisible(multiple::Integer, divisor::Integer)::Integer

Calculates the sum of all integers up to `multiple` that are divisible by `divisor`.

# Arguments
- `multiple::Integer`: The upper limit (inclusive) for the numbers to be summed.
- `divisor::Integer`: The divisor to check divisibility.

# Returns
- `Integer`: The sum of all numbers up to `multiple` that are divisible by `divisor`.
"""
function sum_divisible(multiple::Integer, divisor::Integer)::Integer
    p = fld(multiple, divisor)
    return fld(divisor * (p * (p + 1)), 2)
end

function p_0001(below::Integer = 1000)::Integer
    return sum_divisible(below - 1, 3) + sum_divisible(below - 1, 5) -
           sum_divisible(below - 1, 15)
end
