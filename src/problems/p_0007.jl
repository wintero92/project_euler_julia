"""
    p_0007(n::Integer = 10_001) -> Integer

Determines the `n`-th prime number by repeatedly applying the Sieve of Eratosthenes. The function begins with an
initial upper limit for prime numbers and uses the sieve to generate all primes up to that limit. If the sieve
does not produce enough prime numbers to reach the `n`-th position, the limit is doubled, and the sieve is
applied again until the desired number of primes is obtained.

# Arguments
- `n::Integer`: The rank of the prime number to find (e.g., 1st, 2nd, 10,001st). Default is 10,001.

# Returns
- `Integer`: The `n`-th prime number.

# Examples
```julia
julia> p_0007(6)
13  # Explanation: The 6th prime number is 13.

julia> p_0007(10_001)
104743  # Explanation: The 10,001st prime number.
"""
function p_0007(n::Integer = 10_001)::Integer
    if n < 1
        throw(ArgumentError("n must be at least 1"))
    end
    limit = 200_000  # Initial limit for the sieve
    primes = sieve_of_eratosthenes(limit)

    # If not enough primes are found, increase the limit and apply the sieve again
    while length(primes) < n
        limit *= 2  # Double the limit to expand the search space
        primes = sieve_of_eratosthenes(limit)  # Reapply the sieve with the new limit
    end

    # Return the `n`-th prime number
    return primes[n]
end
