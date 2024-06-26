"""
    collatz_length(n::Integer, cache::Dict{Int, Int}) -> Integer

Calculates the length of the Collatz sequence starting from `n`. Utilizes a cache to store and reuse previously
computed lengths of sequences for efficiency. The Collatz sequence is defined such that for a given number `n`:
- If `n` is even, the next number is `n / 2`.
- If `n` is odd, the next number is `3n + 1`.
- This process repeats until `n` becomes 1.

# Arguments
- `n::Integer`: The starting number of the Collatz sequence.
- `cache::Dict{Int, Int}`: A dictionary used to store lengths of Collatz sequences for previously computed numbers.

# Returns
- `Integer`: The length of the Collatz sequence starting from `n`.

# Examples
```julia
julia> collatz_length(13, Dict(1 => 1))
10  # Explanation: The sequence for 13 has 10 steps.
"""
function collatz_length(n::Integer, cache::Dict{Int, Int})::Integer
    if haskey(cache, n)
        return cache[n]
    end
    original_n = n
    length = 0

    # Compute the Collatz sequence length for n
    while n != 1 && !haskey(cache, n)
        if n % 2 == 0
            n ÷= 2
        else
            n = 3n + 1
        end
        length += 1
    end

    # Cache the result to optimize future computations
    if n != 1
        length += cache[n]
    end

    cache[original_n] = length
    return length
end

"""
    p_0014(limit::Integer = 1_000_000) -> Integer

Finds the starting number under `limit` that produces the longest Collatz sequence. Uses a cache to optimize
the computation of sequence lengths.

# Arguments
- `limit::Integer`: The upper boundary (exclusive) for checking starting numbers. Default is 1,000,000.

# Returns
- `Integer`: The starting number under `limit` that produces the longest Collatz sequence.

# Examples
```julia
julia> p_0014(1_000_000)
837799  # This is the starting number under 1,000,000 that produces the longest Collatz sequence.
"""
function p_0014(limit::Integer = 1_000_000)::Integer
    cache = Dict{Int, Int}()
    cache[1] = 1 # Base case: the sequence length for 1 is 1
    max_length = 0
    max_starting_number = 1

    # Iterate through each number and calculate the Collatz sequence length
    for i in 2:limit
        length = collatz_length(i, cache)
        if length > max_length
            max_length = length
            max_starting_number = i
        end
    end

    return max_starting_number
end
