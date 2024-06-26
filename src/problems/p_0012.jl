"""
    count_divisors(n::Integer) -> Integer

Calculates the number of divisors of the given integer `n`. The function efficiently counts divisors by
only iterating up to the square root of `n`. For each divisor `i` found, it also considers `n / i` as a
divisor pair, unless `i` squared equals `n`.

# Arguments
- `n::Integer`: The integer for which to count divisors.

# Returns
- `Integer`: The number of divisors of `n`.

# Examples
```julia
julia> count_divisors(28)
6  # Explanation: The divisors of 28 are 1, 2, 4, 7, 14, and 28.

julia> count_divisors(36)
9  # Explanation: The divisors of 36 are 1, 2, 3, 4, 6, 9, 12, 18, and 36.
"""
function count_divisors(n::Integer)::Integer
    count = 0
    sqrt_n = floor(Int, sqrt(n))
    # Iterate over all numbers from 1 to the square root of n
    for i in 1:sqrt_n
        if n % i == 0
            if i * i == n
                # i is a perfect square divisor of n
                count += 1
            else
                # i and n/i are distinct divisors
                count += 2
            end
        end
    end

    return count
end

"""
    p_0012(min_divisors::Integer = 500) -> Integer

Finds the first triangle number with more than `min_divisors` divisors. A triangle number is defined
as the sum of the natural numbers up to a certain number `n`. This function iteratively calculates triangle
numbers and checks the number of their divisors using the `count_divisors` function until it finds one that
meets the condition of having more than `min_divisors` divisors.

# Arguments
- `min_divisors::Integer`: The minimum number of divisors required. Default is 500.

# Returns
- `Integer`: The first triangle number that has more than `min_divisors` divisors.

# Examples
```julia
julia> p_0012(5)
28  # Explanation: The first triangle number with more than 5 divisors is 28, which has 6 divisors.

julia> p_0012(500)
76576500  # This is the first triangle number with more than 500 divisors.
"""
function p_0012(min_divisors::Integer = 500)::Integer
    n = 1
    triangle = 0
    while true
        # Calculate the nth triangle number
        triangle += n

        # Count the divisors of the current triangle number
        divisors = count_divisors(triangle)

        # Check if the number of divisors exceeds the specified minimum
        if divisors > min_divisors
            return triangle
        end

        n += 1  # Increment n for the next triangle number
    end
end
