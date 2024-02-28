def generate_combinations(binary):
    results = []
    generate_helper(binary, 0, "", results)
    return results


def generate_helper(binary, index, current, results):
    if index == len(binary):
        results.append(current)
        return

    if binary[index] == '*':
        generate_helper(binary, index + 1, current + '0', results)
        generate_helper(binary, index + 1, current + '1', results)
    else:
        generate_helper(binary, index + 1, current + binary[index], results)


# Example usage
binary = "001*1**"
combinations = generate_combinations(binary)
print(combinations)
