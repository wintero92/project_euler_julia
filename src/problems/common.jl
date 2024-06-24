function is_palindrome(value::Integer)::Bool
    value_digits = digits(value)
    n = length(value_digits)
    for i = 1:(n÷2)
        if value_digits[i] != value_digits[n-i+1]
            return false
        end
    end
    return true
end
