from robot.api import logger
from robot.libraries.BuiltIn import BuiltIn
import re

__version__ = '1.0.0'

class InitializeArgumentFileLib(object):
    ROBOT_LIBRARY_VERSION = __version__
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'

    def load_config_file(self, filePath):
        
        # See env.config argument file

        with open(filePath) as f:
            for line in f:
                z = re.search("(.*) ([A-Za-z0-9-_ ]+):(.*)", line)
                print(line)
                BuiltIn().set_global_variable("${" + z.group(2) + "}", z.group(3))
                logger.info("argument taken: "+ z.group(2) + " with value: " + z.group(3))
        return z.groups()