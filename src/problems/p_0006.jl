"""
    sum_of_squares(n::Integer) -> Integer

Calculates the sum of the squares of the first `n` natural numbers using the mathematical formula:
\\[ \\frac{n(n + 1)(2n + 1)}{6} \\]
This formula is derived from the method of finite differences and provides a direct computation method that is far more efficient than iteratively summing squares.

# Arguments
- `n::Integer`: The number of consecutive natural numbers starting from 1 to compute the square sum for.

# Returns
- `Integer`: The sum of squares of the first `n` natural numbers.

# Examples
```julia
julia> sum_of_squares(5)
55  # Explanation: 1^2 + 2^2 + 3^2 + 4^2 + 5^2 = 55

julia> sum_of_squares(10)
385  # Explanation: Sum of the squares of numbers from 1 to 10.
"""
function sum_of_squares(n::Integer)::Integer
    # Use the closed-form formula to calculate the sum of squares efficiently
    return n * (n + 1) * (2 * n + 1) ÷ 6
end

"""
    square_of_sum(n::Integer) -> Integer

Calculates the square of the sum of the first `n` natural numbers. This function uses the formula:
\\[ \\text{Sum} = \\frac{n(n + 1)}{2} \\]
to calculate the sum of the first `n` numbers and then squares the result to get the final answer. This method is both direct and efficient, avoiding the need for iterative addition.

# Arguments
- `n::Integer`: The number of consecutive natural numbers starting from 1.

# Returns
- `Integer`: The square of the sum of the first `n` natural numbers.

# Examples
```julia
julia> square_of_sum(5)
225  # Explanation: The sum of the numbers 1 through 5 is 15, and 15^2 = 225

julia> square_of_sum(10)
3025  # Explanation: The sum of the numbers 1 through 10 is 55, and 55^2 = 3025
"""
function square_of_sum(n::Integer)::Integer
    # Calculate the sum of the first n natural numbers using the formula
    sum = n * (n + 1) ÷ 2
    # Return the square of the calculated sum
    return sum * sum
end

"""
    p_0006(n::Integer = 100) -> Integer

Calculates the difference between the square of the sum and the sum of the squares of the first `n` natural numbers. This computation is based on two key mathematical formulas:
1. Square of sum: \\( \\left(\\frac{n(n + 1)}{2}\\right)^2 \\)
2. Sum of squares: \\( \\frac{n(n + 1)(2n + 1)}{6} \\)

The function first calculates these two quantities using helper functions `square_of_sum` and `sum_of_squares`, and then computes their difference. This difference highlights interesting properties of number sequences and is useful in various mathematical proofs and programming problems.

# Arguments
- `n::Integer`: The number of consecutive natural numbers starting from 1. Default is 100.

# Returns
- `Integer`: The difference between the square of the sum of the first `n` natural numbers and the sum of their squares.

# Examples
```julia
julia> p_0006(10)
2640  # Explanation: Square of the sum of the first 10 natural numbers is 3025 and the sum of the squares is 385. Their difference is 2640.

julia> p_0006(100)
25164150  # Explanation: For the first 100 natural numbers.

"""
function p_0006(n::Integer = 100)::Integer
    # Calculate the sum of the squares of the first n natural numbers
    sum_squares = sum_of_squares(n)
    # Calculate the square of the sum of the first n natural numbers
    square_sum = square_of_sum(n)
    # Return the difference between the square of the sum and the sum of squares
    return square_sum - sum_squares
end
