include("common.jl")

function p_0004(digits::Integer = 3)::Integer
    max_by_digits::Integer = 10^digits - 1
    min_by_digits::Integer = 10^(digits - 1)
    a = max_by_digits
    largest_palindrome::Integer = 0
    while a >= min_by_digits
        c::Integer = 0
        if a % 11 == 0
            b = max_by_digits
            c = 1
        else
            b = 11 * (10^(digits - 1) - 10)
            c = 11
        end
        while b >= a
            if a * b <= largest_palindrome
                break
            end
            if is_palindrome(a * b)
                largest_palindrome = a * b
            end
            b -= c
        end
        a -= 1
    end
    return largest_palindrome
end
