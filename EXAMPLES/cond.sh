echo 'Load policies'
curl -s -G "http://127.0.0.1:8001/paapi/loadpol?policyfile=EXAMPLES/policy1.pl&token=admin_token"


echo 'set to test_policy_book'
curl -s -G "http://127.0.0.1:8001/paapi/setpol?policy=Policy1&token=admin_token"


echo 'get the policy'
curl -s -G "http://127.0.0.1:8001/paapi/getpol?token=admin_token"


echo 'load test CONDITION'
curl -s -G "http://127.0.0.1:8001/paapi/loadcondi" --data-urlencode "cond_elements=[
	condition_predicate( test1, [time, time]),
	(test1(timeLimit,requestedTime) :- time_in_range( timeLimit, requestedTime, time_now ))
	]" --data-urlencode "token=admin_token"
	

echo 'TEST ACCESS WITHOUT CONDITION'	
curl -s -G "http://127.0.0.1:8001/pqapi/access?user=u1&object=o1&ar=w"


echo 'TEST THE CONDITION 1'	
curl -s -G "http://127.0.0.1:8001/pqapi/access?user=u1&object=o1&ar=w&cond=test1(time(23,23,23),time(1,1,1))"


