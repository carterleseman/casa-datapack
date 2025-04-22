import re

def replace_skullowner_with_components(input_path, output_path):
    with open(input_path, 'r') as file:
        lines = file.readlines()

    current_color = None
    new_lines = []

    # regex pattern for SkullOwner Id array
    skullowner_pattern = re.compile(r'SkullOwner:\{Id:\[I;[^\]]+\]\}')

    for line in lines:
        stripped = line.strip()

        # detect color header
        if stripped.startswith("#"):
            current_color = stripped[1:].strip().title() # e.g. "light gray" => "Light Gray"
            print(f"Current color set to: {current_color}")
            new_lines.append(line)
            continue

        # only process lines with target head block
        if "#pbroll:heads{" in line and "SkullOwner:{Id:[" in line:
            replacement = f'components:{{"minecraft:item_name":"{current_color} Bedroll"}}'
            # replace all instances of the SkullOwner:{Id:[I;...]} pattern
            line = skullowner_pattern.sub(replacement, line)

        new_lines.append(line)

    with open(output_path, 'w') as file:
        file.writelines(new_lines)

input_path = "data/pbroll/function/place/roll/east.mcfunction"
output_path = "test.mcfunction"

replace_skullowner_with_components(input_path, input_path)