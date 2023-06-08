import unittest
from user_teams import models


class UserModelTest(unittest.TestCase):
    def test_name_length(self):
        user = models.Users.objects.get(id=1)
        name_length = user._meta.get_field("first_name").max_length
        self.assertEqual(name_length, 200)

    def test_object_name_is_first_name_space_last_name_space_second_name(self):
        user = models.Users.objects.get(id=1)
        expected_object_name = f"{user.first_name} {user.last_name} {user.second_name}"
        self.assertEqual(str(user), expected_object_name)

#if __name__ == '__main__':
#    unittest.main()
