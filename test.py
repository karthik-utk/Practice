from app import get_message

def test_get_message():
    # Jenkins will assert that our function returns exactly what we expect
    assert get_message() == "Hi karthik"
