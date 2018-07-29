from .question_1 import add_two

def test_numbers_3_4():
    assert add_two(3, 4) == 7
 
def test_strings_a_3():
    assert add_two('a', 3) == 'a3'