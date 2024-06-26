"""
    p_0009(sum::Integer = 1000) -> Union{Int, Nothing}

Finds the product of a Pythagorean triplet `(a, b, c)` where the sum `a + b + c` equals a specified value.
The function searches for two integers, `m` and `n`, such that `m > n`, and uses these to generate a Pythagorean
triplet using Euclid's formula:
    - a = m^2 - n^2
    - b = 2mn
    - c = m^2 + n^2
If the sum of the generated triplet equals the specified `sum`, the function returns the product `a * b * c`.
Otherwise, it continues searching until all possible pairs are exhausted.

# Arguments
- `sum::Integer`: The desired sum of the Pythagorean triplet.

# Returns
- `Union{Int, Nothing}`: The product of the Pythagorean triplet if found, otherwise `nothing`.

# Examples
```julia
julia> p_0009(12)
60  # Explanation: The triplet (3, 4, 5) adds up to 12 and their product is 60.

julia> p_0009(1000)
31875000  # Explanation: The triplet (200, 375, 425) adds up to 1000 and their product is 31875000.
"""
function p_0009(sum::Integer = 1000)::Union{Int, Nothing}
    # Iterate over possible values of m
    for m in 2:floor(Int, sqrt(sum))
        # Iterate over possible values of n which are less than m
        for n in 1:(m - 1)
            # Compute the values of a, b, c using Euclid's formula
            a = m^2 - n^2
            b = 2 * m * n
            c = m^2 + n^2
            # Check if the sum of a, b, c equals the specified sum
            if a + b + c == sum
                return a * b * c  # Return the product of a, b, c
            end
        end
    end

    return nothing  # Return nothing if no suitable triplet is found
end
