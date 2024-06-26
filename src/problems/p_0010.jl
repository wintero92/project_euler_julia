"""
    p_0010(limit::Integer = 2_000_000) -> Integer

Calculates the sum of all prime numbers less than a specified `limit`. This function wraps the `sieve_of_eratosthenes`
algorithm, which efficiently finds all prime numbers below the given `limit`, and then returns the sum of these prime numbers.
Using `sieve_of_eratosthenes` ensures that the calculation is both fast and accurate.

# Arguments
- `limit::Integer`: The upper boundary, exclusive, below which prime numbers are summed. Default is 2,000,000.

# Returns
- `Integer`: The sum of all prime numbers below `limit`.

# Examples
```julia
julia> p_0010(10)
17  # Explanation: The primes below 10 are 2, 3, 5, and 7. Their sum is 17.

julia> p_0010(2_000_000)
142913828922  # This would be the sum of all primes below 2,000,000.
"""
function p_0010(limit::Integer = 2_000_000)::Integer
    # Calculate and sum all primes below the specified limit using the Sieve of Eratosthenes
    return sum(sieve_of_eratosthenes(limit))
end
