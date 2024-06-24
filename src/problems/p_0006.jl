function sum_of_squares(n::Integer)
    return n * (n + 1) * (2 * n + 1) ÷ 6
end

function square_of_sum(n::Integer)
    sum = n * (n + 1) ÷ 2
    return sum * sum
end

function p_0006(n::Integer = 100)
    sum_squares = sum_of_squares(n)
    square_sum = square_of_sum(n)
    return square_sum - sum_squares
end
