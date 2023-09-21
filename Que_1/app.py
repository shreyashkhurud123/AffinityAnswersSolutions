import re
import requests

post_api = "http://www.postalpincode.in/api/pincode/"


def validate_address(address):
    pincode = re.search(r'\b\d{6}\b', address)

    if pincode:
        pincode = pincode.group()
    else:
        return "No Pincode Entered"
    
    response = requests.get(post_api + pincode)

    if response.status_code == 200:
        data = response.json()
        for item in data['PostOffice']:
            if item['Name'] in address:
                return pincode
        return 'Pincode Not matching to the address'
    return 'Pincode Invalid'


address = list()

#Correct Addresses
address.append("2nd Phase, 374/B, 80 Feet Rd, Mysore Bank Colony, Banashankari 3rd Stage, Srinivasa Nagar, Bengaluru, Karnataka 560050")   
address.append("2nd Phase, 374/B, 80 Feet Rd, Bank Colony, Banashankari 3rd Stage, Srinivasa Nagar, Bengaluru, Karnataka 560050")
address.append("374/B, 80 Feet Rd, State Bank Colony, Banashankari 3rd Stage, Srinivasa Nagar, Bangalore. 560050")

#Incorrect Address
address.append("2nd Phase, 374/B, 80 Feet Rd, Mysore Bank Colony, Banashankari 3rd Stage, Srinivasa Nagar, Bengaluru, Karnataka 560095")
address.append("Colony, Bengaluru, Karnataka 560050")

for addr in address:
    print(validate_address(addr))
