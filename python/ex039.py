"""
Exercise 39: Kilometres to Miles Converter
Problem: Ask the user to enter a distance in kilometres.
Convert it to miles and print the result. (1 km = 0.621371 miles)
"""

def milesConvert(kilometres: int) -> float:
    return round((kilometres * 0.621371), 2)

def main():
    distance = int(input('Distance in kilometres: '))
    
    miles = milesConvert(kilometres=distance)
    print(f"{distance}km = {miles} miles")
    ...

if __name__ == "__main__":
    main()