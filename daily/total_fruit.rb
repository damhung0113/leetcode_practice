# https://leetcode.com/problems/fruit-into-baskets/description/
# Basically it's just: "Find the longest continuous sub array that has exactly 2 distinct elements."

# @param {Integer[]} fruits
# @return {Integer}
def total_fruit(fruits)
  n = fruits.length
  basket = Hash.new { 0 }
  left = max = 0

  0.upto(n - 1).each do |right|
    basket[fruits[right]] += 1

    while basket.size > 2
      basket[fruits[left]] -= 1
      if basket[fruits[left]] == 0
        basket.delete(fruits[left])
      end
    end

    max = [max, right - left + 1].max
  end

  max
end

p total_fruit [1, 2, 1, 1, 1]
