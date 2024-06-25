"""
    is_palindrome(value::Integer)::Bool

Checks if a given integer is a palindrome. A palindrome is a number that reads the same forwards and backwards.

# Arguments
- `value::Integer`: The integer to check.

# Returns
- `Bool`: `true` if the integer is a palindrome, `false` otherwise.

# Example
```julia
julia> is_palindrome(121)
true

julia> is_palindrome(123)
false
```
"""
function is_palindrome(value::Integer)::Bool
    value_digits = digits(value)
    n = length(value_digits)
    mid = fld(n, 2)

    for i in 1:mid
        if value_digits[i] != value_digits[n - i + 1]
            return false
        end
    end

    return true
end
