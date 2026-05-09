"""
Exercise 40: Age in Days
Problem: Ask the user to enter their age in years.
Print approximately how many days they have lived. (Use 365 days per year.)
"""

def ageInDays(age: int) -> int:
    return age * 365

def main():
    age = int(input("Your age is: "))
    days = ageInDays(age=age)
    print(f"You have lived {days} day(s).")
    ...

if __name__ == "__main__":
    main()
