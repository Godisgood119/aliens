import os
import json

path = "\\".join(__file__.split("\\")[:-1])

dir_contents = os.listdir(path)
dir_contents = [x for x in dir_contents if "." not in x]


for obj_folder in dir_contents:
    with open(f'{path.replace('\\', '/')}/{obj_folder}/{obj_folder}.yy', 'r') as file:
        str_yy = file.read()

        yy_dict = json.loads(str_yy[:-3] + "}")

        # print(yy_dict)

# with open(f'{path.replace('\\', '/')}/obj_boss/obj_boss.yy', 'r') as file:
#     str_yy = file.read()
#     yy_dict = json.loads(str_yy)
#     print(yy_dict)
