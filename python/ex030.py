"""
Exercise 30: Temperature Converter (Formula Practice)
Problem: Convert 100 degrees Celsius to Fahrenheit using the formula: F = (C * 9/5) + 32.
Print the result.
"""
def fahrenheitConvert(celcius: int) -> float:
    return (celcius * 9/5) + 32

def main():
    celcius = 100
    farenheit = fahrenheitConvert(celcius=celcius)
    print(f"{celcius} degree(s) Celcius is {farenheit} degree(s) Fahreinheit.")
    ...

if __name__ == "__main__":
    main()