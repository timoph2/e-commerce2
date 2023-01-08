

var amqp = require('amqplib/callback_api');



amqp.connect('amqp://localhost', (error0, connection) => {
    if (error0) { throw error0; }

    connection.createChannel((error1, channel) => {
        if (error1) { throw error1; }
// initliase queue.
        var queue = 'hello';
        channel.assertQueue(queue, {
            durable: false
        });
// begin listening
// lol so i need ser up this whole listening chunk each tiem to LISTEN?
        console.log(" [*] Waiting for messages in %s. To exit press CTRL+C", queue);
        channel.consume(queue, (msg) => {
// succesfully retrieved message from queue. 
// output message
            console.log(" [x] Received %s", msg.content.toString());
            //assign msg as variable 
        }, {
            noAck: true
        });
    });
});

//start by sending the API message over. 
// (ues random numb geerator for now )


//this whole code chunk BEFORE displaying the
// final orders page to load API msg.

//This 'listen' chunk save as function, to retrieve
// 1. Quotes
// 2. Simple Point calculation (have to send data too) //can send as param?
// 


//so from the main page, how to CALL the microservice to SEND a msg?
// how to 'node file.js' or 'python file.py' in code as tho its cmd