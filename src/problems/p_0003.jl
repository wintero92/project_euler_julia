function p_0003(value::Integer = 600_851_475_143)::Integer
    while value % 2 == 0
        value = fld(value, 2)
    end
    divisor::Int64 = 3
    max_divisor = isqrt(value)
    while value > 1 && divisor <= max_divisor
        if value % divisor == 0
            value = fld(value, divisor)
            max_divisor = floor(Int, sqrt(value))
        end
        divisor += 2
    end
    return value
end