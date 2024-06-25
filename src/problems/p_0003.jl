"""
    p_0003(value::Integer = 600_851_475_143)::Integer

Calculate the largest prime factor of a given number. This function iteratively removes the smallest factors, beginning with 2, and continues with odd divisors. The search for factors stops once all prime factors are extracted or when the divisor exceeds the square root of the remaining number, which indicates the remaining number is prime.

# Arguments
- `value::Integer`: The number from which to find the largest prime factor. Default is 600,851,475,143.

# Returns
- `Integer`: The largest prime factor of `value`.

# Examples
```julia
julia> p_0003(13195)
29  # Explanation: The prime factors of 13195 are 5, 7, 13, and 29, and the largest is 29.

julia> p_0003(600_851_475_143)
6857  # This would be the largest prime factor of 600,851,475,143.
"""
function p_0003(value::Integer = 600_851_475_143)::Integer
    # Remove factors of 2 until the number is odd
    while value % 2 == 0
        value = fld(value, 2)
    end
    divisor::Int64 = 3  # Start checking for factors from the smallest odd prime
    max_divisor = isqrt(value)  # Calculate the initial square root of the number

    # Loop over odd divisors to find prime factors
    while value > 1 && divisor <= max_divisor
        if value % divisor == 0
            value = fld(value, divisor)  # Remove the factor
            max_divisor = isqrt(value)  # Update the square root of the modified number
        else
            divisor += 2  # Only test odd divisors
        end
    end

    # If the loop ends because divisor surpassed max_divisor, value is prime
    return value
end
