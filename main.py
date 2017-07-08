
import time
from microservice.server import server

_ONE_DAY_IN_SECONDS = 60 * 60 * 24

if __name__ == '__main__':
    server.start()

    try:
        while True:
            time.sleep(_ONE_DAY_IN_SECONDS)
    except KeyboardInterrupt:
        app_server.stop(0)
