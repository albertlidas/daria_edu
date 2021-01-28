def unique_names(names1, names2):
    res = (list(sorted((set(names1 + names2)))))
    return res

names1 = ["Ava", "Emma", "Olivia"]
names2 = ["Olivia", "Sophia", "Emma"]

print(unique_names)