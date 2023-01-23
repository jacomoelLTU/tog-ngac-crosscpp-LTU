echo 'load example policy 1 immediate'

curl -s -G "http://127.0.0.1:8001/paapi/loadi" --data-urlencode "policyspec=policy('2023ExP1',access,[
    user('User1'),
    user('User2'),
    user('User3'),
    user_attribute('Group1'),
    user_attribute('Group2'),
    object('S1'),
    object('S2'),
    object('S3'),
    object_attribute('TempSensor'),
    object_attribute('Thermostat'),
    policy_class('access'),
    connector('PM'),
    assign('User1', 'Group1'),
    assign('User2', 'Group1'),
    assign('User3', 'Group2'),
    assign('S1', 'TempSensor'),
    assign('S2', 'TempSensor'),
    assign('S3', 'Thermostat'),
    assign('Group1', 'access'),
    assign('Group2', 'access'),
    assign('TempSensor', 'access'),
    assign('Thermostat', 'access'),
    assign('access', 'PM'),
    associate('Group1', [r], 'TempSensor'),
    associate('Group2', [r,w], 'Thermostat')])" --data-urlencode "token=admin_token"

echo 'ipolicy should now be loaded onto the PolicyServer, run GET POLICY next'
curl -s -G "http://127.0.0.1:8001/paapi/setpol" --data-urlencode "policy=2023ExP1" --data-urlencode "token=admin_token"

echo 'get policy'
curl  -G "http://127.0.0.1:8001/paapi/getpol" --data-urlencode "token=admin_token"

#echo 'read the policy (explicitly named as ipolicy)'
#curl -s -G "http://127.0.0.1:8001/paapi/readpol" --data-urlencode "policy=ipolicy" --data-urlencode "token=admin_token"

echo 'run test to verify ipolicy worsk as it should, expect: G,G,G,D,G'
curl  'http://127.0.0.1:8001/pqapi/access?user=User1&ar=r&object=S1'
curl  'http://127.0.0.1:8001/pqapi/access?user=User2&ar=r&object=S2'
curl  'http://127.0.0.1:8001/pqapi/access?user=User3&ar=r&object=S3'
curl  'http://127.0.0.1:8001/pqapi/access?user=User1&ar=r&object=S3'
curl  'http://127.0.0.1:8001/pqapi/access?user=User3&ar=w&object=S3'

echo 'end of ipolicy TEST, should still be loaded onto server'





