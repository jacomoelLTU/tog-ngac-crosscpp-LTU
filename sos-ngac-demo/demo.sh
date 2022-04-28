echo 'Load policy'
curl -s -G "http://127.0.0.1:8001/paapi/loadpol" --data-urlencode "policyfile=sos-ngac-demo/demo.pl" --data-urlencode "token=admin_token"

echo ''
echo 'Set the policy to demo'
curl -s -G "http://127.0.0.1:8001/paapi/setpol?policy=sosngacdemo" --data-urlencode "token=admin_token"

echo ''
echo 'Reset conditions'
curl -s -G "http://127.0.0.1:8001/paapi/resetcond" --data-urlencode "token=admin_token"

echo ''
echo 'Load condition immediate. Readback time set to 10 seconds (10000 milliseconds)'
curl -s -G "http://127.0.0.1:8001/paapi/loadcondi" --data-urlencode "cond_elements=[
	condition_predicate(time_conditional_read,[number, number]),
	(time_conditional_read(X,Y) :-  X >= Y - 10000)
	]" --data-urlencode "token=admin_token"
	

echo ''
echo '------- TESTS -------'
echo 'Test User read without condition (should deny)'
curl -s 'http://127.0.0.1:8001/pqapi/access?user=User&ar=r&object=SensorData'

echo ''
echo 'Test Sensor write without condition (should grant)'
curl -s 'http://127.0.0.1:8001/pqapi/access?user=Sensor&ar=w&object=SensorData'

echo ''
echo 'Test user read with condition (should grant)'
curl -s "http://127.0.0.1:8001/pqapi/access?user=User&object=SensorData&ar=r&cond=time_conditional_read(1651142811345,1651142816345)"

echo ''
echo 'Test Admin read without condition (should grant)'
curl -s 'http://127.0.0.1:8001/pqapi/access?user=Admin&ar=r&object=SensorData'

echo ''
echo 'Test Admin write CommonFile without condition (should grant)'
curl -s 'http://127.0.0.1:8001/pqapi/access?user=Admin&ar=w&object=SensorData'

echo ''
echo 'Test Admin read without condition (should grant)'
curl -s 'http://127.0.0.1:8001/pqapi/access?user=Admin&ar=r&object=SensorData'

echo ''
echo 'Test Admin read CommonFile with condition (should grant)'
curl -s 'http://127.0.0.1:8001/pqapi/access?user=Admin&ar=r&object=SensorData&cond=time_conditional_read(1651142811345,1651142816345)'

echo ''
echo 'Test Admin write CommonFile with condition (should grant)'
curl -s 'http://127.0.0.1:8001/pqapi/access?user=Admin&ar=w&object=SensorData&cond=time_conditional_read(1651142811345,1651142816345)'
