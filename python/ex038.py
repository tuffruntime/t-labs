"""
Exercise 38: Simple Interest Calculator
Problem: Ask the user for principal, rate of interest, and time (in years).
Calculate and print the simple interest using the formula: SI = (P * R * T) / 100
"""

def calculateSI(principal: float, interest: float, time: float) -> float:
    return round((principal * interest * time) / 100, 2)

def main():
    p = float(input('Principle number: '))
    r = float(input('Rate of Interest: '))
    t = float(input('Time (in years): '))
    
    si = calculateSI(principal=p, interest=r, time=t)
    print(f"The Simple Interest is {si}")
    ...

if __name__ == "__main__":
    main()