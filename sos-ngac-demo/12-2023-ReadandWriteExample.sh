echo 'load example policy 1 immediate'

curl -s -G "http://127.0.0.1:8001/paapi/loadi" --data-urlencode "policyspec=policy(ipolicy,access,[
    user('User1'),
    user('User2'),
    user_attribute('Group1'),
    user_attribute('Group2'),
    object('S1'),
    object('S2'),
    object_attribute('TempSensorZoneA'),
    object_attribute('TempSensorZoneB'),
    policy_class('access'),
    connector('PM'),
    assign('User1','Group1'),
    assign('User2','Group2'),
    assign('S1','TempSensorZoneA'),
    assign('S2','TempSensorZoneB'),
    assign('Group1','access'),
    assign('Group2','access'),
    assign('TempSensorZoneA','access'),
    assign('TempSensorZoneB','access'),
    assign('access', 'PM'),
    associate('Group1', [r], 'TempSensorZoneA'),
    associate('Group2', [r,w], 'TempSensorZoneB')])" --data-urlencode "token=admin_token"

echo 'ipolicy should now be loaded onto the PolicyServer, run GET POLICY next'
curl -s -G "http://127.0.0.1:8001/paapi/setpol" --data-urlencode "policy=ipolicy" --data-urlencode "token=admin_token"

echo 'get policy'
curl  -G "http://127.0.0.1:8001/paapi/getpol" --data-urlencode "token=admin_token"

#echo 'read the policy (explicitly named as ipolicy)'
#curl -s -G "http://127.0.0.1:8001/paapi/readpol" --data-urlencode "policy=ipolicy" --data-urlencode "token=admin_token"

echo 'run test to verify ipolicy worsk as it should, expect: G, D, G, D'
curl  'http://127.0.0.1:8001/pqapi/access?user=User1&ar=r&object=S1'
curl  'http://127.0.0.1:8001/pqapi/access?user=User1&ar=r&object=S2'
curl  'http://127.0.0.1:8001/pqapi/access?user=User2&ar=r&object=S2'
curl  'http://127.0.0.1:8001/pqapi/access?user=User2&ar=r&object=S1'

echo 'try write, only user 2 should be able to write'

curl 'http://127.0.0.1:8001/pqapi/access?user=User1&ar=w&object=S2'
curl  'http://127.0.0.1:8001/pqapi/access?user=User2&ar=w&object=S2'

echo 'end of ipolicy TEST, should still be loaded onto server'






