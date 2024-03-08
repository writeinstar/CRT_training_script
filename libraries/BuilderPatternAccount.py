from robot.api import logger
import random
import string

__version__ = '1.0.0'


class BuilderPatternAccount(object):
    ROBOT_LIBRARY_VERSION = __version__
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'

    def __init__(self):
        self.account_name = ''

    def get_account_name(self):
        
        return self.account_name

    def set_account_name(self, account_name):

        domains = ["hotmail.com", "gmail.com", "aol.com",
                   "mail.com", "mail.kz", "yahoo.com"]

        return [self.account_name = account_name]

    def get_account_object(self):
        return self