import re

def parse_enums(file_path):
    enums = {}
    current_enum = None
    
    with open(file_path, 'r', encoding='utf-8') as file:
        for line in file:
            enum_match = re.match(r'Enum: \[(.+?)\]', line)
            key_value_match = re.match(r'\s*Key: \[(.*?)\] Value: \[(.*?)\]', line)
            
            if enum_match:
                current_enum = enum_match.group(1)
                enums[current_enum] = {}
            elif key_value_match and current_enum:
                key, value = key_value_match.groups()
                value = int(value) if value.isdigit() or value.lstrip('-').isdigit() else value
                if not key or re.search(r'[^a-zA-Z0-9_]', key) or key[0].isdigit() or key in ['true', 'false']:
                    key = f'["{key}"]'
                enums[current_enum][key] = value
    
    return enums

def generate_lua(enums, output_path):
    with open(output_path, 'w', encoding='utf-8') as file:
        for enum_name, values in enums.items():
            file.write(f"-- @enum {enum_name}\n")
            file.write(f"Enums.{enum_name} = {{\n")
            
            for key, value in values.items():
                file.write(f"  {key} = {value},\n")
            
            file.write("}\n\n")

def main():
    input_file = "enums_list.txt"
    output_file = "enums.lua"
    enums = parse_enums(input_file)
    generate_lua(enums, output_file)
    print(f"Fichier Lua généré : {output_file}")

if __name__ == "__main__":
    main()
