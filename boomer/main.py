import requests
from os import environ

def run():
    address = environ.get('ADDRESS', 'localhost')
    port = environ.get('PORT', '8181')
    count = int(environ.get('COUNT', '100'))
    protocol = environ.get('PROTOCOL', 'http')
    
    for _ in range(count):
        r = requests.get(f'{protocol}://{address}:{port}')
        print(r)

if __name__ == "__main__":
    run()
