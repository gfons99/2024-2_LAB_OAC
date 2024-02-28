# author: F.R., G.M.
# date: 2024-02-28
# description: Convierte una tabla de verdad (con 0, 1 y *) en un formato adecuado para una memoria ROM en VHDL


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


binary_dict = {}


def binary_concatenation(inputs, outputs):
    combinations = generate_combinations(inputs)
    # Print concatenation
    for bin_num in combinations:
        dec_num = int(bin_num, 2)
        # print(f"{dec_num} => \"{outputs}\"")
        binary_dict[dec_num] = outputs


# Example usage
ins = "0000***"
ous = "0010001"
binary_concatenation(ins, ous)
ins = "0001***"
ous = "0100011"
binary_concatenation(ins, ous)
ins = "001*0**"
ous = "1101011"
binary_concatenation(ins, ous)
ins = "001*1**"
ous = "0111010"
binary_concatenation(ins, ous)
ins = "010***0"
ous = "0110100"
binary_concatenation(ins, ous)
ins = "010*0*1"
ous = "1000111"
binary_concatenation(ins, ous)
ins = "010*1**"
ous = "1011101"
binary_concatenation(ins, ous)
ins = "011**0*"
ous = "1101011"
binary_concatenation(ins, ous)
ins = "011**1*"
ous = "1110001"
binary_concatenation(ins, ous)
ins = "100**0*"
ous = "1101010"
binary_concatenation(ins, ous)
ins = "100**1*"
ous = "1110010"
binary_concatenation(ins, ous)
ins = "101**0*"
ous = "1011000"
binary_concatenation(ins, ous)
ins = "101**1*"
ous = "0001000"
binary_concatenation(ins, ous)
ins = "110****"
ous = "0000100"
binary_concatenation(ins, ous)
ins = "111****"
ous = "0001000"
binary_concatenation(ins, ous)

print(binary_dict)
for key, value in binary_dict.items():
    print(f"{key} => \"{value}\",")