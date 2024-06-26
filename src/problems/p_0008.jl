default_number_str = replace("""
    73167176531330624919225119674426574742355349194934
    96983520312774506326239578318016984801869478851843
    85861560789112949495459501737958331952853208805511
    12540698747158523863050715693290963295227443043557
    66896648950445244523161731856403098711121722383113
    62229893423380308135336276614282806444486645238749
    30358907296290491560440772390713810515859307960866
    65727333001053367881220235421809751254540594752243
    70172427121883998797908792274921901699720888093776
    52584907711670556013604839586446706324415722155397
    53697817977846174064955149290862569321978468622482
    83972241375657056057490261407972968652414535100474
    82166370484403199890008895243450658541227588666881
    16427171479924442928230863465674813919123162824586
    17866458359124566529476545682848912883142607690042
    24219022671055626321111109370544217506941658960408
    07198403850962455444362981230987879927244284909188
    84580156166097919133875499200524063689912560717606
    05886116467109405077541002256983155200055935729725
    71636269561882670428252483600823257530420752963450
    """, r"\s" => "")

"""
    p_0008(number_str::String, k::Int = 13) -> Int

Calculates the greatest product of `k` consecutive digits in a provided string of numbers. The function first cleans
the input string by removing all whitespace characters, then iterates over every possible sequence of `k` consecutive
digits within the string, calculating the product of these digits. It keeps track of the maximum product encountered
during this iteration.

This approach is efficient for examining large sequences of digits, leveraging Julia's string manipulation and
numerical conversion capabilities.

# Arguments
- `number_str::String`: A string consisting of digits potentially interspersed with whitespace, which should be ignored.
- `k::Int`: The number of consecutive digits to multiply. Default is 13.

# Returns
- `Int`: The maximum product of `k` consecutive digits found in the `number_str`.

# Examples
```julia
julia> p_0008("1234567898765", 5)
15120  # Explanation: The highest product of 5 consecutive digits in "1234567898765" is 15120 (from "98765").

julia> p_0008(
73167176531330624919225119674426574742355349194934
96983520312774506326239578318016984801869478851843
85861560789112949495459501737958331952853208805511
12540698747158523863050715693290963295227443043557
66896648950445244523161731856403098711121722383113
62229893423380308135336276614282806444486645238749
30358907296290491560440772390713810515859307960866
70172427121883998797908792274921901699720888093776
65727333001053367881220235421809751254540594752243
52584907711670556013604839586446706324415722155397
53697817977846174064955149290862569321978468622482
83972241375657056057490261407972968652414535100474
82166370484403199890008895243450658541227588666881
16427171479924442928230863465674813919123162824586
17866458359124566529476545682848912883142607690042
24219022671055626321111109370544217506941658960408
07198403850962455444362981230987879927244284909188
84580156166097919133875499200524063689912560717606
05886116467109405077541002256983155200055935729725
71636269561882670428252483600823257530420752963450
, 13)
104743  # This is the maximum product of 13 consecutive digits found in the given long number string.
"""
function p_0008(number_str::String = default_number_str, k::Int = 13)::Int
    # Initialize `max_product` to store the maximum product found.
    max_product = 0

    # Iterate through each possible starting point of a sequence of `k` consecutive digits.
    for i in 1:(length(number_str) - k + 1)
        product = 1
        # Compute the product of `k` consecutive digits starting from index `i`.
        for j in 0:(k - 1)
            product *= parse(Int, number_str[i + j])
        end
        # Update `max_product` if the current product is greater.
        if product > max_product
            max_product = product
        end
    end

    return max_product
end
