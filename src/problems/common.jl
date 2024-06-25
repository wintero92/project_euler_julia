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
