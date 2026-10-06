#Hidden Pattern – Duplicate & Position Logic
data = [12, 7, 12, 5, 7, 9, 5, 12, 9, 7, 15]

checked = []

print("Duplicate Values:")

for value in data:
    if value not in checked:
        count = data.count(value)

        if count > 1:
            print(value, "->", count, "times")

        checked.append(value)


#Missing Number Logic
ids = [1, 2, 3, 4, 5, 7, 8, 9, 10]

n = 10

expected_sum = n * (n + 1) // 2
actual_sum = sum(ids)

missing_id = expected_sum - actual_sum

print("Missing ID:", missing_id)


