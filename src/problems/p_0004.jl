"""
    p_0004(digits::Integer = 3)::Integer

Calculates the largest palindrome that is a product of two numbers, each having a specified number of digits. This algorithm employs a strategic approach to enhance the efficiency of the palindrome search. Key to this approach is the insight that in any product resulting in an even-digit palindrome, at least one of the multipliers must be divisible by 11. This property stems from the characteristics of number theory relevant to the digits of products.

# Arguments
- `digits::Integer`: Specifies the number of digits in the numbers to be multiplied. The default is set to 3.

# Returns
- `Integer`: The largest palindrome which is a product of two numbers each having `digits` digits.

# Examples
```julia
julia> p_0004(2)
9009  # This result comes from 91 * 99 = 9009, the largest palindrome from the product of two 2-digit numbers.

julia> p_0004(3)
906609  # This result comes from 913 * 993 = 906609, the largest palindrome from the product of two 3-digit numbers.
"""
function p_0004(digits::Integer = 3)::Integer
    # Initialize the highest and lowest numbers with the specified number of digits.
    max_by_digits::Integer = 10^digits - 1
    min_by_digits::Integer = 10^(digits - 1)
    # Start from the highest possible number with 'digits' digits.
    a = max_by_digits
    # This will hold the largest palindrome found during the computation.
    largest_palindrome::Integer = 0

    # Loop over possible values of 'a', starting from the highest.
    while a >= min_by_digits
        # Initialize variables for the inner loop.
        b::Integer = 0
        step::Integer = 0

        # Check if 'a' is divisible by 11.
        if a % 11 == 0
            b = max_by_digits
            step = 1  # All numbers are considered since 'a' is divisible by 11.
        else
            b = 11 * fld(max_by_digits, 11)  # Start from the largest number less than 'max_by_digits' that is divisible by 11.
            step = 11  # Only multiples of 11 are considered.
        end

        # Check products of 'a' and 'b', where 'b' also decrements, but only considering relevant candidates based on above conditions.
        while b >= a
            # If the current product is less than or equal to the largest palindrome found, break out of the loop early.
            if a * b <= largest_palindrome
                break
            end
            # Check if the product is a palindrome.
            if is_palindrome(a * b)
                # Update the largest palindrome if a new one is found.
                largest_palindrome = a * b
            end
            b -= step  # Decrement 'b' by 'step', focusing the search efficiently.
        end

        a -= 1  # Decrement 'a' and continue the search.
    end

    # Return the largest palindrome found.
    return largest_palindrome
end
