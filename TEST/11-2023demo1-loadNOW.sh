echo 'load example policy 1 immediate'

curl -G "http://127.0.0.1:8001/paapi/loadi" --data-urlencode "policyspec=policy(ExPolicy1,23Demo1,[
	
    user('User1'),
    user('User2'),
    user('User3'),

    user_attribute('Group1'),
    user_attribute('Group2'),

    object('S1'),
    object('S2'),
    object('S3'),

    object_attribute('23Demo1'),
    object_attribute('23Demo1'),

    policy_class('23Demo1'),
    connector('PM'),

    assign('User1','Group1'),
    assign('User2','Group1'),
    assign('User3', 'Group2'),

    assign('S1', 'TempSensor'),
    assign('S2', 'TempSensor'),
    assing('S3', 'Thermostat'),

    assign('Group1', '23Demo1'),
    assign('Group2', '23Demo1'),
    assign('TempSensor', '23Demo1'),
    assign('Thermostat', '23Demo1'),
    assign('23Demo1', 'PM'),

    associate('Group1', [r], 'TempSensor'),
    associate('Group2', [r,w], 'Thermostat')])" --data-urlencode "token=admin_token"

echo 'ExPolicy1 should now be loaded onto the PolicyServer, run GET POLICY next'
curl -G "http://127.0.0.1:8001/paapi/getpol" --data-urlencode "token=admin_token"

echo 'run test to verify ExPolicy1 worsk as it should, expect: G,G,G,D,G'

curl 'http://127.0.0.1:8001/pqapi/access?user=User1&ar=r&object=S1'
curl 'http://127.0.0.1:8001/pqapi/access?user=User2&ar=r&object=S2'
curl 'http://127.0.0.1:8001/pqapi/access?user=User3&ar=r&object=S3'
curl 'http://127.0.0.1:8001/pqapi/access?user=User1&ar=r&object=S3'
curl 'http://127.0.0.1:8001/pqapi/access?user=User3&ar=w&object=S3'

echo 'end of ExPolicy1 TEST, should still be loaded onto server'






