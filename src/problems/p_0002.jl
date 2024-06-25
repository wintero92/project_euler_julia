"""
    p_0002(below::Integer = 4_000_000)::Integer

Calculate the sum of all even Fibonacci numbers up to a specified limit. The function utilizes a property of the Fibonacci sequence that every third number is even, and computes the sum directly without iterating through all Fibonacci numbers.

# Arguments
- `below::Integer`: The upper limit (exclusive) for the Fibonacci sequence. Default is 4,000,000.

# Returns
- `Integer`: The sum of even Fibonacci numbers less than `below`.

# Examples
```julia
julia> p_0002(100)
44  # Explanation: 2 + 8 + 34 = 44

julia> p_0002(4_000_000)
4613732  # This would be the sum of all even Fibonacci numbers below 4,000,000.
"""
function p_0002(below::Integer = 4_000_000)::Integer
    f3::Integer = 2 # f3 holds the last even Fibonacci number computed
    f6::Integer = 0 # f6 holds the even Fibonacci number before f3
    r::Integer = 2 # r is the current Fibonacci number being considered
    s::Integer = 0 # s accumulates the sum of even Fibonacci numbers
    while r < below
        s += r  # Add the current even Fibonacci number to the sum
        r = 4 * f3 + f6  # Calculate the next even Fibonacci number
        f6, f3 = f3, r  # Update the previous two even Fibonacci numbers
    end

    return s  # Return the accumulated sum
end
