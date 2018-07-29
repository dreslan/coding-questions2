from .question_2 import multiply_two

def test_numbers_3_4():
    assert multiply_two(3, 4) == 12
 
def test_strings_a_3():
    assert multiply_two('a', 3) == 'aaa'