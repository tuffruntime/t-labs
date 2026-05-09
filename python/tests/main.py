import pytest

from python.ex030 import fahrenheitConvert
from python.ex038 import calculateSI

"""
Test
Exercise 30: Temperature Converter (Formula Practice)
"""
@pytest.mark.parametrize("temp, expected", [
    (58, 136.4),
    (60, 140.0),
    (100, 212.0),
])
def test_fahrenheitConvert(temp: int, expected: float) -> None:
    assert fahrenheitConvert(temp) == expected

"""
Test
Exercise 38: Simple Interest Calculator
"""
def test_calculateSI() -> None:
    assert calculateSI(5,2.5,1) == 0.12
    assert calculateSI(19,5,20) == 19.0

