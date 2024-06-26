"""
    is_palindrome(value::Integer)::Bool

Determine whether a given integer is a palindrome. A palindrome is a sequence that reads the same backward as forward.

# Arguments
- `value::Integer`: The integer to check for palindromicity.

# Returns
- `Bool`: Returns `true` if `value` is a palindrome; otherwise, `false`.

# Examples
```julia
julia> is_palindrome(121)
true

julia> is_palindrome(-121)
false

julia> is_palindrome(123)
false
"""
function is_palindrome(value::Integer)::Bool
    # Convert the integer to its absolute value to ensure negative numbers are handled correctly.
    value = abs(value)
    # Extract digits of the integer into an array.
    value_digits = digits(value)

    # Determine the midpoint of the digits array.
    mid = fld(length(value_digits), 2)

    # Check each digit from the start against its corresponding from the end.
    for i in 1:mid
        if value_digits[i] != value_digits[end - i + 1]
            # Early exit with `false` if a mismatch is found.
            return false
        end
    end

    # If no mismatches were found, return `true`.
    return true
end

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
