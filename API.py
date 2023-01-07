import requests
import os
# pip install requests 

API_KEY = os.environ['API_NINJA']
print(API_KEY)  #press run to test if get

category = 'music'
api_url = 'http://api.api-ninjas.com/v1/trivia?category={}'.format(category) #switch to http instead of https
response = requests.get(api_url, headers={'X-Api-Key': API_KEY})
if response.status_code == requests.codes.ok:
    print(response.text)
    # print(response)
    question = response.text[1]
    answer = response.text[2]
    # print(question + '\n' + answer)
else:
    print("Error:", response.status_code, response.text)



