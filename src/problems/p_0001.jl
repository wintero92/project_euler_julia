function _sum_divisible(multiple::Integer, divisor::Integer)::Integer
    p = fld(multiple, divisor)
    return fld(divisor * (p * (p + 1)), 2)
end

function p_0001(below::Integer=1000)::Integer
    return _sum_divisible(below - 1, 3) + _sum_divisible(below - 1, 5) - _sum_divisible(below - 1, 15)
end