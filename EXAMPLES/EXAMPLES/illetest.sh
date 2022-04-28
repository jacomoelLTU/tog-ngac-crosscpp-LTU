echo 'Load policy'
curl -s -G "http://127.0.0.1:8001/paapi/loadpol" --data-urlencode "policyfile=EXAMPLES/EXAMPLES/illetest.pl" --data-urlencode "token=admin_token"


echo ''
echo 'Set the policy to illetest'
curl -s -G "http://127.0.0.1:8001/paapi/setpol?policy=illetest" --data-urlencode "token=admin_token"


echo ''
echo 'Reset conditions'
curl -s -G "http://127.0.0.1:8001/paapi/resetcond" --data-urlencode "token=admin_token"

echo ''
echo 'Test without cond'
curl -s 'http://127.0.0.1:8001/pqapi/access?user=u1&ar=r&object=o1'


echo ''
echo 'Load condition immediate. Readback time set to 10 minutes'
curl -s -G "http://127.0.0.1:8001/paapi/loadcondi" --data-urlencode "cond_elements=[
	condition_predicate(time_conditional_read,[number, number]),
	(time_conditional_read(X,Y) :-  X =< Y-2)
	]" --data-urlencode "token=admin_token"
    

echo ''
echo 'Test without cond'
curl -s 'http://127.0.0.1:8001/pqapi/access?user=u1&ar=r&object=o1'


echo ''
echo 'Test with cond'
curl -s "http://127.0.0.1:8001/pqapi/access?user=u1&object=o1&ar=r&cond=time_conditional_read(2,5)"





