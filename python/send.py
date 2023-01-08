

#initialise queue. (how keep it running tho)
#
import pika
# python -m pip install pika --upgrade
connection = pika.BlockingConnection(
    pika.ConnectionParameters(host='localhost'))
channel = connection.channel()

channel.queue_declare(queue='hello')


##
#
# call API here to get msg
# then SEND it below
##



# at the final order confirmation generation page,
# this code must trigger to SEND the quote to be RECIEVED by app.get('orders')
##
#send a message. 
channel.basic_publish(exchange='', routing_key='hello', body='Hello World!')
print(" [x] Sent 'Hello World!'")
connection.close()