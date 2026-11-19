# Combined Python solutions for the Week 7 lists assignment.
# Sections: list warmup, shopping list, and list report.

# --- list_warmup.py ---
fruits = ["mango", "banana", "orange", "apple"]

print("First fruit:", fruits[0])
print("Last fruit:", fruits[-1])

fruits.append("pineapple")
print("After append:", fruits)

fruits.remove("banana")
print("After remove:", fruits)

print("Number of fruits remaining:", len(fruits))

# --- shopping_list.py ---
shopping_list = []

while True:
    print("\nShopping List Menu: add / remove / show / done")
    choice = input("Choose an action: ").strip().lower()

    if choice == "add":
        item = input("Enter item to add: ").strip()
        if item:
            shopping_list.append(item)
            print(f"Added: {item}")
        else:
            print("Item name cannot be empty.")

    elif choice == "remove":
        item = input("Enter item to remove: ").strip()
        if item in shopping_list:
            shopping_list.remove(item)
            print(f"Removed: {item}")
        else:
            print("That item is not on your list.")

    elif choice == "show":
        if shopping_list:
            print("Your shopping list:")
            for item in shopping_list:
                print(f"- {item}")
        else:
            print("Your shopping list is empty.")

    elif choice == "done":
        print("Goodbye! Happy shopping.")
        break

    else:
        print("Please choose add, remove, show, or done.")

# --- list_report.py ---
items = ["bread", "avocado", "milk", "sweet potatoes", "tea"]

print("Numbered items:")
for index, item in enumerate(items, start=1):
    print(f"{index}. {item}")

long_names_count = 0
for item in items:
    if len(item) > 4:
        long_names_count += 1

print("Items with more than 4 letters:", long_names_count)

longest_item = items[0]
for item in items:
    if len(item) > len(longest_item):
        longest_item = item

print("Longest item name:", longest_item)
