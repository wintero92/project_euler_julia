"""
    sieve_of_eratosthenes(limit::Integer) -> Vector{Int}

Implements the Sieve of Eratosthenes algorithm to identify all prime numbers up to a specified `limit`.
Named after the ancient Greek mathematician Eratosthenes, this algorithm is a highly efficient way
to find all prime numbers smaller than a given limit. It does so by iteratively marking the multiples
of each discovered prime number starting from 2.

The core idea is simple: Start with an assumption that all numbers are prime. Then, sequentially eliminate
multiples of each prime number starting from 2. By the time you reach a number n, if it has not been marked
as non-prime, then it is prime. The reason this method is efficient is because it eliminates the need to check
each number individually through division; instead, it systematically removes non-prime candidates in a series
of sweeping actions across the number range.

# Arguments
- `limit::Integer`: The upper boundary up to which primes are to be found, exclusive of the limit itself.

# Returns
- `Vector{Int}`: An array containing all prime numbers less than `limit`.

# Examples
```julia
julia> sieve_of_eratosthenes(10)
[2, 3, 5, 7]  # The primes less than 10 are 2, 3, 5, and 7.

julia> sieve_of_eratosthenes(30)
[2, 3, 5, 7, 11, 13, 17, 19, 23, 29]  # The primes less than 30 are listed.
"""
function sieve_of_eratosthenes(limit::Integer)::Vector{Int}
    # Initialize a boolean array, is_prime, to true for all positions indicating all numbers are initially considered prime.
    is_prime = trues(limit)
    is_prime[1] = false # Set the first index to false as 1 is not a prime number.
    # Begin marking non-prime numbers starting with the first prime number, 2.
    p = 2
    while p^2 <= limit
        if is_prime[p]
            # If `p` is a prime, mark all multiples of `p` starting from `p^2` to `limit` as non-prime.
            for i in (p^2):p:limit
                is_prime[i] = false
            end
        end
        p += 1  # Move to the next number.
    end

    # Collect the numbers that remain marked as prime into the list `primes`.
    primes = []
    for p in 2:limit
        if is_prime[p]
            push!(primes, p)  # Add `p` to the list of primes.
        end
    end

    return primes  # Return the list of primes.
end

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
