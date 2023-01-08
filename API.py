import requests
import os
# pip install requests 

API_KEY = os.environ['API_NINJA']
print(API_KEY)  #press run to test if get

category = 'music'
api_url = 'http://api.api-ninjas.com/v1/trivia?category={}'.format(category) #switch to http instead of https
response = requests.get(api_url, headers={'X-Api-Key': API_KEY})
if response.status_code == requests.codes.ok:
    result = response.text
else:
    print("Error:", response.status_code, response.text)



import pika
# python -m pip install pika --upgrade
connection = pika.BlockingConnection(
    pika.ConnectionParameters(host='localhost'))
channel = connection.channel()

channel.queue_declare(queue='hello')


#send a message. 
channel.basic_publish(exchange='', routing_key='hello', body=result)
print("sennnnnnnnnnnnnnd")
connection.close()


