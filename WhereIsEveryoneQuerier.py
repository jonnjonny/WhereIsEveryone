# -*- coding: utf-8 -*-
"""
Created on Sat Oct 21 19:48:08 2017

@author: jeffr
"""
import requests, json
from flask import Flask
from flask import jsonify
from time import time

app = Flask(__name__)

@app.route('/')
def hello_world():
	return 'Hello, World!'
	
@app.route('/traffic')
def api_articles():
    return 'what time?'

@app.route('/traffic/<timestamp>')
def api_article(timestamp):
    # token
    tokens = {'access_token': 'eyJhbGciOiJSUzI1NiIsImtpZCI6ImxlZ2FjeS10b2tlbi1rZXkiLCJ0eXAiOiJKV1QifQ.eyJqdGkiOiIwMGU0NGE0OTI4ZWQ0NTBiYmIxMGVlZWZkN2NiYmNkMiIsInN1YiI6ImhhY2thdGhvbiIsInNjb3BlIjpbInVhYS5yZXNvdXJjZSIsImllLWN1cnJlbnQuU0RTSU0tSUUtUFVCTElDLVNBRkVUWS5JRS1QVUJMSUMtU0FGRVRZLkxJTUlURUQuREVWRUxPUCIsImllLWN1cnJlbnQuU0RTSU0tSUUtRU5WSVJPTk1FTlRBTC5JRS1FTlZJUk9OTUVOVEFMLkxJTUlURUQuREVWRUxPUCIsImllLWN1cnJlbnQuU0RTSU0tSUUtVFJBRkZJQy5JRS1UUkFGRklDLkxJTUlURUQuREVWRUxPUCIsImllLWN1cnJlbnQuU0RTSU0tSUUtUEFSS0lORy5JRS1QQVJLSU5HLkxJTUlURUQuREVWRUxPUCIsImllLWN1cnJlbnQuU0RTSU0tSUUtUEVERVNUUklBTi5JRS1QRURFU1RSSUFOLkxJTUlURUQuREVWRUxPUCJdLCJjbGllbnRfaWQiOiJoYWNrYXRob24iLCJjaWQiOiJoYWNrYXRob24iLCJhenAiOiJoYWNrYXRob24iLCJncmFudF90eXBlIjoiY2xpZW50X2NyZWRlbnRpYWxzIiwicmV2X3NpZyI6IjlmMWYyYzRkIiwiaWF0IjoxNTA4NjQxMjg2LCJleHAiOjE1MDkyNDYwODYsImlzcyI6Imh0dHBzOi8vODkwNDA3ZDctZTYxNy00ZDcwLTk4NWYtMDE3OTJkNjkzMzg3LnByZWRpeC11YWEucnVuLmF3cy11c3cwMi1wci5pY2UucHJlZGl4LmlvL29hdXRoL3Rva2VuIiwiemlkIjoiODkwNDA3ZDctZTYxNy00ZDcwLTk4NWYtMDE3OTJkNjkzMzg3IiwiYXVkIjpbImllLWN1cnJlbnQuU0RTSU0tSUUtVFJBRkZJQy5JRS1UUkFGRklDLkxJTUlURUQiLCJpZS1jdXJyZW50LlNEU0lNLUlFLVBBUktJTkcuSUUtUEFSS0lORy5MSU1JVEVEIiwiaWUtY3VycmVudC5TRFNJTS1JRS1QVUJMSUMtU0FGRVRZLklFLVBVQkxJQy1TQUZFVFkuTElNSVRFRCIsInVhYSIsImhhY2thdGhvbiIsImllLWN1cnJlbnQuU0RTSU0tSUUtRU5WSVJPTk1FTlRBTC5JRS1FTlZJUk9OTUVOVEFMLkxJTUlURUQiLCJpZS1jdXJyZW50LlNEU0lNLUlFLVBFREVTVFJJQU4uSUUtUEVERVNUUklBTi5MSU1JVEVEIl19.eUK2TtC3qVn6AVkPqGXgB07tZqWCFq3dSTeF0EPs8Z6gttLMqLRaKEsGPI1_dQpr2KgFLCJRc2XKrua9xwvkJ5cJ5rLGtTmoakX21ItduGR4bpbpcr1z5l9K_OOE8mCg4PnEOAUkNSc6m17ARFEU6tig5hEaf87sizjMGFAMFwB3xcrEg17l_zXceK6HGSfY8kAeguG5CntACgtqYRAKlO3ZwGNfbeKQL9rnA41MDpGIqD7rtz7KA4xUexG9hBzoiUGeeRUBIRGWL47d7IPmAyGc_sQUVNzogK7a8ychn27ME457kE8wVR8KwqE-ziwIgclGTnf-bmSZC1Aaw4d4mQ',
 'expires_in': 604799,
 'jti': '9a08ed399e2343baacaf6d7ca27186f5',
 'scope': 'uaa.resource ie-current.SDSIM-IE-PUBLIC-SAFETY.IE-PUBLIC-SAFETY.LIMITED.DEVELOP ie-current.SDSIM-IE-ENVIRONMENTAL.IE-ENVIRONMENTAL.LIMITED.DEVELOP ie-current.SDSIM-IE-TRAFFIC.IE-TRAFFIC.LIMITED.DEVELOP ie-current.SDSIM-IE-PARKING.IE-PARKING.LIMITED.DEVELOP ie-current.SDSIM-IE-PEDESTRIAN.IE-PEDESTRIAN.LIMITED.DEVELOP',
 'token_type': 'bearer'}
    walkways = ['30-1077-2-E',
            '30-1066-2-W',
            '30-1017-2-S',
            '30-1074-2-W',
            '30-1074-1-S',
            '30-1063-2-W',
            '30-1065-2-E',
            '30-1065-1-N',
            '30-233',
            '30-229',
            '30-225',
            '30-1018-1-S',
            '30-1018-2-W',
            '30-1073-2-S',
            '30-1070-2-E',
            '30-276',
            '30-1071-2-S',
            '30-1064-1-S',
            '30-1046-2-E',
            '30-1046-1-N',
            '30-1054-2-N',
            '30-1052-2-E',
            '30-1041-2-N',
            '30-1030-2-W',
            '30-1039-2-S',
            '30-1082-2-S',
            '30-1082-1-E',
            '30-1081-2-S',
            '30-1081-1-E',
            '30-1037-1-W',
            '30-1050-2-S',
            '30-1040-2-S',
            '30-1042-2-S',
            '30-1047-2-S',
            '30-1042-1-E']
    dummy = {}
    cTime = time()*1000
    timestamp = float(timestamp)
    
    if timestamp > cTime:
        # return future prediction
        print("generating prediction")
        clusters = {'A':['30-1077-2-E'],
            'B':['30-1066-2-W'],
            'C':['30-1017-2-S','30-1074-2-W','30-1074-1-S'],
            'D':['30-1063-2-W'],
            'E':['30-1065-2-E','30-1065-1-N'],
            'F':['30-225','30-1018-1-S','30-1018-2-W'], # first two are zero
            'G':['30-1073-2-S','30-1070-2-E','30-276'],
            'H':['30-1071-2-S','30-1064-1-S'],
            'I':['30-1046-2-E','30-1046-1-N','30-1054-2-N'],
            'J':['30-1052-2-E','30-1041-2-N','30-1030-2-W','30-1039-2-S'],
            'K':['30-1082-2-S','30-1082-1-E'],
            'L':['30-1081-2-S','30-1081-1-E'],
            'M':['30-1037-1-W','30-1050-2-S','30-1040-2-S'],
            'N':['30-1042-2-S','30-1047-2-S','30-1042-1-E']}
        
        letter = ['A',
                  'B',
                  'C',
                  'D',
                  'E',
                  'F', # first two are zero
                  'G',
                  'H',
                  'I',
                  'J',
                  'K',
                  'L',
                  'M',
                  'N']
        
        #1508684400000 - 1508727600000 (8AM to 8PM today)
        ln = int((timestamp - 1508684400000)/60000)
        
        f = open('sampled_traffic.txt', 'r')
        line = f.readline(ln)
        
        for x in letter:
            n = line.count(x)
            walkways = clusters[x]
            
            for y in walkways:
                dummy[y] = str(int((2*n)**2/len(walkways)*2))
        #janky shit
        dummy['30-233'] = '0'
        dummy['30-229'] = '0'
        
    else:
        # call api
        print("fetching from smartcity API")
        for i in range(35):
            url = "https://ic-event-service.run.aws-usw02-pr.ice.predix.io/v2/locations/LOCATION-" + walkways[i] + "/events"
            querystring = {"eventType":"PEDEVT", "endTime":str(int(timestamp)), "startTime":str(int(timestamp-600000))}
            headers = {
                'authorization': 'Bearer ' + tokens['access_token'],
                'predix-zone-id': "SDSIM-IE-PEDESTRIAN",
                'cache-control': "no-cache",
                }
            response = requests.request("GET", url, headers=headers, params=querystring)
            #print(response.text)
            data = json.loads(response.text)['content']

            val = []
            for x in data:
                try:
                    val.append(x['measures']['pedestrianCount'])
                except:
                    val.append(x['measures']['counter_direction_pedestrianCount'])
                    
            if val != []:
                dummy[walkways[i]] = str(int(sum(val)/len(val)))
            else:
                dummy[walkways[i]] = '0'
            
#    dummy = {'LocID1': 200, 'LocID2': 250}
    #print(dummy)
    return jsonify(dummy)

if __name__ == '__main__':
    app.run()